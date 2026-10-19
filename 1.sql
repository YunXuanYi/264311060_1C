-- TABEL INDUK: MAHASISWA

CREATE TABLE mahasiswa (
    nim VARCHAR(15) NOT NULL,
    nama_mahasiswa VARCHAR(100) NOT NULL,
    kelas VARCHAR(30) NOT NULL,

    CONSTRAINT pk_mahasiswa
        PRIMARY KEY (nim)
) ENGINE = InnoDB;

-- TABEL INDUK: RUANG

CREATE TABLE ruang (
    no_ruang VARCHAR(10) NOT NULL,
    id_lokasi VARCHAR(10) NOT NULL,
    jenis_ruang VARCHAR(30) NOT NULL,

    CONSTRAINT pk_ruang
        PRIMARY KEY (no_ruang)
) ENGINE = InnoDB;

-- TABEL TRANSAKSI: PENGAJUAN_RUANG

CREATE TABLE pengajuan_ruang (
    nomor_pengajuan VARCHAR(20) NOT NULL,
    nim VARCHAR(15) NOT NULL,
    no_ruang VARCHAR(10) NOT NULL,
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
        REFERENCES mahasiswa (nim)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_pengajuan_ruang
        FOREIGN KEY (no_ruang)
        REFERENCES ruang (no_ruang)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_jam_penggunaan
        CHECK (jam_selesai > jam_mulai)
) ENGINE = InnoDB;
