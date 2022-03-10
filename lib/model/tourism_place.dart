class TourismPlace {
  String name;
  String location;
  String imageAsset;
  String imageNetwork;
  String dayOpen;
  String timeOpen;
  String ticketPrice;
  String description;
  List<String> gallery;

  TourismPlace({
    required this.name,
    required this.location,
    required this.imageAsset,
    required this.imageNetwork,
    required this.dayOpen,
    required this.timeOpen,
    required this.ticketPrice,
    required this.description,
    required this.gallery,
  });
}

var tourismPlaceList = [
  TourismPlace(
      name: 'Kampung Arab',
      location:
          'Jl. Ampel Kejeron I No.4, RT.006/RW.02, Ampel, Kec. Semampir, Kota SBY, Jawa Timur 60151',
      imageAsset: '',
      imageNetwork:
          'https://res.klook.com/image/upload/fl_lossy.progressive,q_85/c_fill,w_680/v1626755500/blog/jdkbtudhoomsvnc6fkis.webp',
      dayOpen: 'Everyday',
      timeOpen: '16.00-00.00',
      ticketPrice: 'Free',
      description:
          'Ini text description contoh lorem ipsum dolor sit amet civis pacem para bellum',
      gallery: [
        'https://img.okezone.com/content/2015/05/07/406/1146134/serunya-menjelajahi-kampung-arab-di-surabaya-lQ0n2YJZ6t.jpg',
        'https://awsimages.detik.net.id/customthumb/2012/08/03/1383/083056_kampungarab1.jpg?w=780&q=90'
      ]),
  TourismPlace(
      name: 'Surabaya Submarine Monument',
      location:
          'Jl. Pemuda No.39, Embong Kaliasin, Kec. Genteng, Kota SBY, Jawa Timur 60271',
      imageAsset: 'assets/img/submarine-1.jpg',
      imageNetwork: '',
      dayOpen: 'Everyday',
      timeOpen: '09.00-18.00',
      ticketPrice: 'Rp10.000',
      description:
          'Ini text description contoh lorem ipsum dolor sit amet civis pacem para bellum',
      gallery: [
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/17/9f/62/87/most-visit-in-town.jpg?w=1200&h=-1&s=1',
        'https://1.bp.blogspot.com/-2urCQQIlt2c/XQrykqD_tAI/AAAAAAABXfM/Cl2smcfOoPwfFnD45TkvQQs-hcLIjn51gCLcBGAs/s1600/BEAA5FC6-389A-4250-9211-B7E2FDF08FFB.jpeg'
      ]),
  TourismPlace(
      name: 'Kelenteng Sanggar Agung',
      location:
          'Jl. Sukolilo No.100, Sukolilo Baru, Kec. Bulak, Kota SBY, Jawa Timur 60122',
      imageAsset: '',
      imageNetwork:
          'https://res.klook.com/image/upload/fl_lossy.progressive,q_85/c_fill,w_680/v1626755660/blog/b3yqh5eoblfvj4fqx0jw.webp',
      dayOpen: 'Everyday',
      timeOpen: '16.00-00.00',
      ticketPrice: 'Rp25.000',
      description:
          'Ini text description contoh lorem ipsum dolor sit amet civis pacem para bellum',
      gallery: [
        'https://www.jejakpiknik.com/wp-content/uploads/2017/11/@majalahpanorama-630x380.jpg',
        'https://sikidang.com/wp-content/uploads/Spot-Wisata-di-Klenteng-Sanggar-Agung.jpg'
      ]),
  TourismPlace(
      name: 'House of Sampoerna',
      location:
          'Taman Sampoerna No.6, Krembangan Utara, Kec. Pabean Cantian, Kota Surabaya, Jawa Timur 60163',
      imageAsset: '',
      imageNetwork:
          'https://res.klook.com/image/upload/fl_lossy.progressive,q_85/c_fill,w_680/v1596025075/blog/shla6846hjygsa9eopwt.webp',
      dayOpen: 'Weekend',
      timeOpen: '10.00-17.00',
      ticketPrice: 'Rp10.000',
      description:
          'Ini text description contoh lorem ipsum dolor sit amet civis pacem para bellum',
      gallery: [
        'https://sewabussurabaya.com/wp-content/uploads/2019/08/tiket-House-Of-Sampoerna.jpg',
        'https://bappeko.surabaya.go.id/ecobis/upload/wisata/sejarah/detail_16_02.jpg'
      ]),
  TourismPlace(
      name: 'Tugu Pahlawan',
      location:
          'Jalan Pahlawan, Alun-alun Contong, Bubutan, Kota Surabaya, Jawa Timur 60174',
      imageAsset: '',
      imageNetwork:
          'https://res.klook.com/image/upload/fl_lossy.progressive,q_85/c_fill,w_680/v1626755840/blog/vxq7yrvxbbqxfxplvysa.webp',
      dayOpen: 'Everyday',
      timeOpen: 'All Day',
      ticketPrice: 'Free',
      description:
          'Ini text description contoh lorem ipsum dolor sit amet civis pacem para bellum',
      gallery: [
        'https://asset.kompas.com/crops/xvrNh5VPIWgmEOr2rybwci3kwtU=/0x0:986x657/750x500/data/photo/2020/01/13/5e1bed0edcc32.jpg',
        'https://gotripina.com/wp-content/uploads/2021/01/Pemuda-berfoto-di-depan-Tugu-Pahlawan-Surabaya-ig-deni_namaku.jpg'
      ]),
  TourismPlace(
      name: 'Patung Suro Boyo',
      location:
          'Jl. Diponegoro No.1-B, Darmo, Kec. Wonokromo, Kota Surabaya, Jawa Timur 60241',
      imageAsset: '',
      imageNetwork:
          'https://i2.wp.com/bangga.surabaya.go.id/wp-content/uploads/2019/04/IMG-20190412-WA0024.jpg?fit=1280%2C854&ssl=1',
      dayOpen: 'Everyday',
      timeOpen: 'All Day',
      ticketPrice: 'Free',
      description:
          'Ini text description contoh lorem ipsum dolor sit amet civis pacem para bellum',
      gallery: [
        'https://indonesiainside.id/wp-content/uploads/2019/05/Patung-Suro-dan-Boyo-750x375.jpg',
        'https://blog.dparagon.com/wp-content/uploads/2021/08/Screenshot_20210819-205811_Maps.jpg'
      ]),
  TourismPlace(
      name: 'Museum 10 November',
      location:
          'Jalan Pahlawan, Alun-alun Contong, Bubutan, Kota Surabaya, Jawa Timur 60174',
      imageAsset: '',
      imageNetwork:
          'https://cdn0-production-images-kly.akamaized.net/k4IUuqgiPByuq5eKAfKL1G7D6VQ=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/952098/original/004985000_1439269472-MSN1.jpg',
      dayOpen: 'Everyday',
      timeOpen: '08.00-16.00',
      ticketPrice: 'Rp25.000',
      description:
          'Ini text description contoh lorem ipsum dolor sit amet civis pacem para bellum',
      gallery: [
        'https://upload.wikimedia.org/wikipedia/commons/a/ab/Museum_10_November.jpg',
        'https://media-cdn.tripadvisor.com/media/photo-s/17/c5/e7/cb/museum-10-november.jpg'
      ]),
  TourismPlace(
      name: 'Kebun Binatang Surabaya (KBS)',
      location:
          'Jl. Setail No.1, Darmo, Kec. Wonokromo, Kota Surabaya, Jawa Timur 60241',
      imageAsset: '',
      imageNetwork:
          'https://res.klook.com/image/upload/fl_lossy.progressive,q_85/c_fill,w_680/v1626756544/blog/d2hwq4cbmmiioikz5abl.webp',
      dayOpen: 'Everyday',
      timeOpen: '09.00-16.00',
      ticketPrice: 'Rp35.000',
      description:
          'Ini text description contoh lorem ipsum dolor sit amet civis pacem para bellum',
      gallery: [
        'https://cdns.klimg.com/kapanlagi.com/g/m/i/miris_ini_tingkah_manusia_yang_ngerusak_kebun_binatang_surabaya/p/kebun_binatang_surabaya_kbs-20160415-119-kapanlagi.jpg',
        'https://cdn-asset.jawapos.com/wp-content/uploads/2020/07/kuda-nil-kbs.jpg'
      ]),
  TourismPlace(
      name: 'Atlantis Land',
      location:
          'Jl. Sukolilo No.100, Sukolilo Baru, Kec. Bulak, Kota Surabaya, Jawa Timur 60122',
      imageAsset: '',
      imageNetwork:
          'https://travelspromo.com/wp-content/uploads/2018/07/Atlantis-Kenjeran-Surabaya.jpg',
      dayOpen: 'Everyday',
      timeOpen: '16.00-00.00',
      ticketPrice: 'Rp55.000',
      description:
          'Ini text description contoh lorem ipsum dolor sit amet civis pacem para bellum',
      gallery: [
        'https://www.lovesuroboyo.org/wp-content/uploads/2019/04/IMG_0623.jpg',
        'https://media-cdn.tripadvisor.com/media/photo-s/13/91/30/f6/atlantis-land.jpg'
      ]),
];
