--  [CREATE]

-- 1. INSERT 3 baris ke tabel induk mahasiswa
INSERT INTO mahasiswa (
    nim,
    nama_mahasiswa,
    kelas
)
VALUES
    ('M101', 'Citra', 'TI-3A'),
    ('M102', 'Dina', 'TI-3B'),
    ('M103', 'Eko', 'TI-3A');

-- 2. INSERT 3 baris ke tabel induk ruang
INSERT INTO ruang (
    no_ruang,
    id_lokasi,
    jenis_ruang
)
VALUES
    ('R301', 'L001', 'Ruang Kelas'),
    ('LAB03', 'L001', 'Laboratorium'),
    ('R401', 'L002', 'Ruang Kelas');

-- 3. INSERT 3 baris ke tabel transaksi pengajuan_ruang
INSERT INTO pengajuan_ruang (
    nomor_pengajuan,
    nim,
    no_ruang,
    tanggal_penggunaan,
    jam_mulai,
    jam_selesai,
    tujuan_penggunaan,
    status_pengajuan,
    alasan
)
VALUES
    (
        'P101',
        'M101',
        'R301',
        '2026-11-01',
        '08:00:00',
        '10:00:00',
        'Kuliah Basis Data',
        'Menunggu',
        NULL
    ),
    (
        'P102',
        'M102',
        'LAB03',
        '2026-11-02',
        '10:00:00',
        '12:00:00',
        'Praktikum Jaringan',
        'Menunggu',
        NULL
    ),
    (
        'P103',
        'M103',
        'R401',
        '2026-11-03',
        '13:00:00',
        '15:00:00',
        'Rapat Kelompok',
        'Disetujui',
        NULL
    );

-- [READ]
SELECT *
FROM mahasiswa;

-- [UPDATE]
UPDATE pengajuan_ruang
SET
    status_pengajuan = 'Ditolak',
    alasan = 'Jadwal laboratorium tidak tersedia'
WHERE nomor_pengajuan = 'P102';

-- cek hasil UPDATE.
SELECT *
FROM pengajuan_ruang
WHERE nomor_pengajuan = 'P102';

-- [DELETE]
DELETE FROM pengajuan_ruang
WHERE nomor_pengajuan = 'P103';

-- mengecek bahwa P103 sudah tidak ada.
SELECT *
FROM pengajuan_ruang
WHERE nomor_pengajuan = 'P103';
