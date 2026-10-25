-- 1.tabel induk lokasi kampus
CREATE TABLE IF NOT EXISTS lokasi_kampus (
    id_lokasi VARCHAR(10) NOT NULL,
    nama_lokasi VARCHAR(100) NOT NULL,

    CONSTRAINT pk_lokasi_kampus
        PRIMARY KEY (id_lokasi),
    CONSTRAINT uq_lokasi_nama
        UNIQUE (nama_lokasi)
) ENGINE = InnoDB;

-- 2.tabel induk mahasiswa
CREATE TABLE IF NOT EXISTS mahasiswa (
    nim VARCHAR(20) NOT NULL,
    nama_mahasiswa VARCHAR(100) NOT NULL,
    kelas VARCHAR(10) NOT NULL,

    CONSTRAINT pk_mahasiswa
        PRIMARY KEY (nim)
) ENGINE = InnoDB;

-- 3.admin
CREATE TABLE IF NOT EXISTS admin_lokasi (
    id_admin VARCHAR(10) NOT NULL,
    id_lokasi VARCHAR(10) NOT NULL,
    nama_admin VARCHAR(100) NOT NULL,

    CONSTRAINT pk_admin_lokasi
        PRIMARY KEY (id_admin),
    CONSTRAINT fk_admin_lokasi_lokasi
        FOREIGN KEY (id_lokasi)
        REFERENCES lokasi_kampus (id_lokasi)
) ENGINE = InnoDB;

-- 4.ruang atau laboratorium
CREATE TABLE IF NOT EXISTS ruang (
    no_ruang VARCHAR(10) NOT NULL,
    id_lokasi VARCHAR(10) NOT NULL,
    jenis_ruang VARCHAR(30) NOT NULL,
    status_ketersediaan VARCHAR(20) NOT NULL DEFAULT 'Tersedia',

    CONSTRAINT pk_ruang
        PRIMARY KEY (no_ruang),
    CONSTRAINT fk_ruang_lokasi
        FOREIGN KEY (id_lokasi)
        REFERENCES lokasi_kampus (id_lokasi),
    CONSTRAINT chk_jenis_ruang
        CHECK (jenis_ruang IN ('Ruang Kelas', 'Laboratorium')),
    CONSTRAINT chk_status_ketersediaan
        CHECK (status_ketersediaan IN ('Tersedia', 'Tidak Tersedia'))
) ENGINE = InnoDB;

-- 5.data pengajuan reservasi ruang
CREATE TABLE IF NOT EXISTS pengajuan_ruang (
    nomor_pengajuan VARCHAR(20) NOT NULL,
    nim VARCHAR(20) NOT NULL,
    no_ruang VARCHAR(10) NOT NULL,
    id_admin VARCHAR(10) NULL,
    tanggal_penggunaan DATE NOT NULL,
    jam_mulai TIME NOT NULL,
    jam_selesai TIME NOT NULL,
    tujuan_penggunaan VARCHAR(255) NOT NULL,
    status_pengajuan VARCHAR(20) NOT NULL DEFAULT 'Menunggu',
    alasan VARCHAR(255) NULL,

    CONSTRAINT pk_pengajuan_ruang
        PRIMARY KEY (nomor_pengajuan),
    CONSTRAINT fk_pengajuan_mahasiswa
        FOREIGN KEY (nim)
        REFERENCES mahasiswa (nim),
    CONSTRAINT fk_pengajuan_ruang_ruang
        FOREIGN KEY (no_ruang)
        REFERENCES ruang (no_ruang),
    CONSTRAINT fk_pengajuan_ruang_admin
        FOREIGN KEY (id_admin)
        REFERENCES admin_lokasi (id_admin),
    CONSTRAINT chk_status_pengajuan
        CHECK (status_pengajuan IN
            ('Menunggu', 'Disetujui', 'Ditolak', 'Dibatalkan')),
    CONSTRAINT chk_jam_pengajuan
        CHECK (jam_selesai > jam_mulai)
) ENGINE = InnoDB;
