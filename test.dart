void main() {
// List<Map<String, String>>? cat=data["category"];
  // print(cat);
  print(addbangers());
}

const data= {
    "banner_one": [
      {
        "banner": "http://devapiv4.dealsdray.com/icons/banner.png"
      },
      {
        "banner": "http://devapiv4.dealsdray.com/icons/banner.png"
      }
    ],
    "category": [
      {
        "label": "Mobile",
        "icon": "http://devapiv4.dealsdray.com/icons/cat_mobile.png"
      },
      {
        "label": "Laptop",
        "icon": "http://devapiv4.dealsdray.com/icons/cat_lap.png"
      },
      {
        "label": "Camera",
        "icon": "http://devapiv4.dealsdray.com/icons/cat_camera.png"
      },
      {
        "label": "LED",
        "icon": "http://devapiv4.dealsdray.com/icons/cat_led.png"
      }
    ],
    "products": [
      {
        "icon": "http://devapiv4.dealsdray.com/icons/Image -75.png",
        "offer": "36%",
        "label": "FINICKY-WORLD V380",
        "SubLabel": "Wireless HD IP Security"
      },
      {
        "icon": "http://devapiv4.dealsdray.com/icons/Image -79.png",
        "offer": "32%",
        "label": "MI LED TV 4A PRO 108 CM",
        "Sublabel": "(43) Full HD Android TV"
      },
      {
        "icon": "http://devapiv4.dealsdray.com/icons/Image -76.png",
        "offer": "12%",
        "label": "HP 245 7th GEN AMD",
        "Sublabel": "(4GB/1TB/DOS)G6"
      },
      {
        "icon": "http://devapiv4.dealsdray.com/icons/Image -80.png",
        "offer": "45%",
        "label": "MI Redmi 5 (Blue,4GB)",
        "Sublabel": "RAM,64GB Storage"
      }
    ],
    "banner_two": [
      {
        "banner": "http://devapiv4.dealsdray.com/icons/discount_banner.png"
      }
    ],
    "new_arrivals": [
      {
        "icon": "http://devapiv4.dealsdray.com/icons/Image 4.png",
        "offer": "21%",
        "brandIcon": "http://devapiv4.dealsdray.com/icons/Image -107.png",
        "label": "Realme 2 Pro(Black,Sea,64 GB)"
      },
      {
        "icon": "http://devapiv4.dealsdray.com/icons/Image -41.png",
        "offer": "21%",
        "brandIcon": "http://devapiv4.dealsdray.com/icons/Image -107.png",
        "label": "Realme 3i (Diamond Red,64 GB) (4 GB...)"
      }
    ],
    "banner_three": [
      {
        "banner": "http://devapiv4.dealsdray.com/icons/Image -97.png"
      },
      {
        "banner": "http://devapiv4.dealsdray.com/icons/Image -99.png"
      }
    ],
    "categories_listing": [
      {
        "icon": "http://devapiv4.dealsdray.com/icons/Image -70.png",
        "offer": "32%",
        "label": "Nokia 8.1(iron,64 GB)"
      },
      {
        "icon": "http://devapiv4.dealsdray.com/icons/Image 7.png",
        "offer": "14%",
        "label": "Redmin Note 7s (Sapphire Blue 64 GB)"
      }
    ],
    "top_brands": [
      {
        "icon": "http://devapiv4.dealsdray.com/icons/brand_bg.png"
      }
    ],
    "brand_listing": [
      {
        "icon": "http://devapiv4.dealsdray.com/icons/Image 4.png",
        "offer": "21%",
        "brandIcon": "http://devapiv4.dealsdray.com/icons/Image -107.png",
        "label": "Realme 2 Pro(Black,Sea,64 GB)"
      },
      {
        "icon": "http://devapiv4.dealsdray.com/icons/Image -41.png",
        "offer": "21%",
        "brandIcon": "http://devapiv4.dealsdray.com/icons/Image -107.png",
        "label": "Realme 3i (Diamond Red,64 GB) (4 GB...)"
      }
    ],
    "top_selling_products": [
      {
        "icon": "http://devapiv4.dealsdray.com/icons/Image 26.png",
        "label": "Moniters"
      },
      {
        "icon": "http://devapiv4.dealsdray.com/icons/Image 27.png",
        "label": "Printers"
      },
      {
        "icon": "http://devapiv4.dealsdray.com/icons/Image 28.png",
        "label": "Cameras"
      },
      {
        "icon": "http://devapiv4.dealsdray.com/icons/Image 29.png",
        "label": "LED Bulb"
      }
    ],
    "featured_laptop": [
      {
        "icon": "http://devapiv4.dealsdray.com/icons/Image -133.png",
        "brandIcon": "http://devapiv4.dealsdray.com/icons/Image -132.png",
        "label": "Apple MacBook Air Core i5th Gen - (8 GB/128 GB SSD/Mac OS...)",
        "price": "284,999"
      },
      {
        "icon": "http://devapiv4.dealsdray.com/icons/Image 23.png",
        "brandIcon": "http://devapiv4.dealsdray.com/icons/Image -33.png",
        "label": "HP 14G APU Dual Core A6 -(4 GB/256 GB SSD/WINDOWS 10)...",
        "price": "284,999"
      }
    ],
    "upcoming_laptops": [
      {
        "icon": "http://devapiv4.dealsdray.com/icons/great_deals.png"
      },
      {
        "icon": "http://devapiv4.dealsdray.com/icons/Image -124.png"
      },
      {
        "icon": "http://devapiv4.dealsdray.com/icons/Image -125.png"
      }
    ],
    "unboxed_deals": [
      {
        "icon": "http://devapiv4.dealsdray.com/icons/Image -70.png",
        "offer": "32%",
        "label": "Nokia 8.1(iron,64 GB)"
      },
      {
        "icon": "http://devapiv4.dealsdray.com/icons/Image 7.png",
        "offer": "14%",
        "label": "Redmin Note 7s (Sapphire Blue 64 GB)"
      }
    ],
    "my_browsing_history": [
      {
        "icon": "http://devapiv4.dealsdray.com/icons/Image 4.png",
        "offer": "21%",
        "brandIcon": "http://devapiv4.dealsdray.com/icons/Image -107.png",
        "label": "Realme 2 Pro(Black,Sea,64 GB)"
      },
      {
        "icon": "http://devapiv4.dealsdray.com/icons/Image -41.png",
        "offer": "21%",
        "brandIcon": "http://devapiv4.dealsdray.com/icons/Image -107.png",
        "label": "Realme 3i (Diamond Red,64 GB) (4 GB...)"
      }
    ]
};

List<Map<String,dynamic>>? ban1=data["banner_one"];
List<Map<String,dynamic>>? ban2=data["banner_two"];
List<Map<String,dynamic>>? ban3=data["banner_three"];
List<Map<String, String>>? cat=data["category"];

addbangers(){
  List<Map<String,dynamic>>? AllBanners=[];
  ban1?.forEach((b)=>AllBanners.add(b));
  ban2?.forEach((b)=>AllBanners.add(b));
  ban3?.forEach((b)=>AllBanners.add(b));
  return(AllBanners);
}