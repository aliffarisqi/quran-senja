class DetailSurahResponse {
  final bool status;
  final int nomor;
  final String nama;
  final int jumlahAyat;
  final String namaLatin;
  final String arti;
  final String tempatTurun;
  final String deskripsi;
  final String audio;
  final List<Ayat> ayat;
  final SurahReference? suratSelanjutnya;
  final dynamic suratSebelumnya;

  DetailSurahResponse({
    required this.status,
    required this.nomor,
    required this.nama,
    required this.jumlahAyat,
    required this.namaLatin,
    required this.arti,
    required this.tempatTurun,
    required this.deskripsi,
    required this.audio,
    required this.ayat,
    this.suratSelanjutnya,
    this.suratSebelumnya,
  });

  factory DetailSurahResponse.fromJson(Map<String, dynamic> json) {
    return DetailSurahResponse(
      status: json['status'],
      nomor: json['nomor'],
      nama: json['nama'],
      jumlahAyat: json['jumlah_ayat'],
      namaLatin: json['nama_latin'],
      arti: json['arti'],
      tempatTurun: json['tempat_turun'],
      deskripsi: json['deskripsi'],
      audio: json['audio'],
      ayat: (json['ayat'] as List).map((e) => Ayat.fromJson(e)).toList(),
      suratSelanjutnya: json['surat_selanjutnya'] != null ? SurahReference.fromJson(json['surat_selanjutnya']) : null,
      suratSebelumnya: json['surat_sebelumnya'],
    );
  }
}

class Ayat {
  final int id;
  final int surah;
  final int nomor;
  final String ar;
  final String tr;
  final String idn;

  Ayat({
    required this.id,
    required this.surah,
    required this.nomor,
    required this.ar,
    required this.tr,
    required this.idn,
  });

  factory Ayat.fromJson(Map<String, dynamic> json) {
    return Ayat(
      id: json['id'],
      surah: json['surah'],
      nomor: json['nomor'],
      ar: json['ar'],
      tr: json['tr'],
      idn: json['idn'],
    );
  }
}

class SurahReference {
  final int id;
  final int nomor;
  final String nama;
  final String namaLatin;
  final int jumlahAyat;
  final String tempatTurun;
  final String arti;
  final String deskripsi;
  final String audio;

  SurahReference({
    required this.id,
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audio,
  });

  factory SurahReference.fromJson(Map<String, dynamic> json) {
    return SurahReference(
      id: json['id'],
      nomor: json['nomor'],
      nama: json['nama'],
      namaLatin: json['nama_latin'],
      jumlahAyat: json['jumlah_ayat'],
      tempatTurun: json['tempat_turun'],
      arti: json['arti'],
      deskripsi: json['deskripsi'],
      audio: json['audio'],
    );
  }
}
