-- 1. SELECT: nama mahasiswa dan hasil COUNT().
-- 2. JOIN: menggabungkan tabel mahasiswa dan pengajuan_ruang.
-- 3. WHERE: memfilter transaksi.
-- 4. GROUP BY: mengelompokkan hasil berdasarkan mahasiswa.

SELECT
    m.nama_mahasiswa,
    COUNT(p.nomor_pengajuan) AS total_pengajuan
FROM mahasiswa AS m
JOIN pengajuan_ruang AS p
    ON p.nim = m.nim
WHERE p.tanggal_penggunaan BETWEEN '2026-11-01' AND '2026-11-30'
GROUP BY
    m.nim,
    m.nama_mahasiswa;
