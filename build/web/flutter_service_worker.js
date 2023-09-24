'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "b68c29e24717a34f2ff2a7e5b386a719",
"assets/AssetManifest.json": "3eb52ff2d786f519b04e906e3775c9a3",
"assets/assets/audios/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/fonts/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/fonts/GothamBold.ttf": "db33e70bc9dee9fa9ae9737ad83d77ba",
"assets/assets/fonts/Lato-Regular.ttf": "122dd68d69fe9587e062d20d9ff5de2a",
"assets/assets/images/08hcy_d.png": "4ab5a4e80f511c84e158f746756520db",
"assets/assets/images/ADYEN.png": "28d6c79200d3ed96ef4c08ac04249c2c",
"assets/assets/images/Artboard_2.png": "781c4be90a05c8961470ffc8c899279b",
"assets/assets/images/Artboard_6_1_(1).png": "acb6900c7860eacbe703e6321311f8dd",
"assets/assets/images/Artboard_7_1.png": "a392e98031c6fac27359ae81232f9745",
"assets/assets/images/Bacdge.png": "15f28145fee32fdd00d7d33a94cfbbc6",
"assets/assets/images/Badge.png": "0f0345cc28f60be8885d82b088e7777a",
"assets/assets/images/Clip_dgroup.png": "de0f6bce4795a8e6e66c77076ce775a2",
"assets/assets/images/Clip_path_group.png": "fe32a2b74127d7805e537de8d320d224",
"assets/assets/images/Clip_path_group_(1).png": "4ad0f5bbed08b05a78fd870135dedb7b",
"assets/assets/images/emad.png": "6c82013a8e04a73407b9a665ef5f7a0f",
"assets/assets/images/fas.png": "d1e2d899f33ccc4e2be74259d8ee0faf",
"assets/assets/images/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/Flags.png": "b1ad02f49ae9853bdbc59ac0ac989e33",
"assets/assets/images/gb.png": "82d4132e42291b18cfaeedacac340eb7",
"assets/assets/images/gmail_(1).png": "2769d6d6c3c0df09eaa793aa404adaee",
"assets/assets/images/Group_1756.png": "2ec15aacf80f769157928eece06cabde",
"assets/assets/images/Group_2234.png": "573b04eed53738d8b43a6401b6c313f4",
"assets/assets/images/Group_2236_(3).png": "284a368e6ab8c04a42b206b8c6ded66e",
"assets/assets/images/Group_228.png": "65b47a25e865b81dfb4fc0570612bd2b",
"assets/assets/images/Group_229.png": "d25236d6e469538823982d767e1fdcdb",
"assets/assets/images/gw.png": "d52d05cc1a96285d65e03196c5146850",
"assets/assets/images/hg.png": "0d072461f498e90c4e8fde8f1f02feb3",
"assets/assets/images/Icon.png": "5a719ecd6cd7538ecee49dcc0e1e7bff",
"assets/assets/images/icons8-filter-32.png": "e6be84ba720866cb9b92a81ce05d15f4",
"assets/assets/images/icons8-sort-30.png": "cbad54982d22966cae7967723496ef3d",
"assets/assets/images/Identification.png": "65b06e87bdd72b4060c449ec9016037e",
"assets/assets/images/Identifiscation.png": "7d3961ed64be56097388b30ebf7d5e79",
"assets/assets/images/image_2.png": "96180e75fe42e32ca433f5569595b055",
"assets/assets/images/instagram.png": "d4740f297acfa498d3a7a342cd200dd0",
"assets/assets/images/linkedin.png": "bb79594447d686850509e3592b7d5b02",
"assets/assets/images/Mask_Group_270_(1).png": "491d76c76753274f839c3e60dd659244",
"assets/assets/images/Mask_Group_51.png": "cbf081ac7955351f335cae68203dcd26",
"assets/assets/images/Mesa_de_trabajo_1_1.png": "a92b8fc6d3155874af9c98ae9714fd25",
"assets/assets/images/sd.png": "a0e1e112bea870c84ef74214af5b0da5",
"assets/assets/images/ss.png": "bb909c39feeb8182cd250639177dd46c",
"assets/assets/images/sse.png": "eb362a457ea5ad74789d66a4df307b78",
"assets/assets/images/ssf.png": "e1a9515427d27715a9ae6c01ea449c6c",
"assets/assets/images/ssq.png": "cd87f1a55309dafcf92dbc6ab8f49672",
"assets/assets/images/Stripe-Emblem.png": "e9294ba8baa273007cfb74b2d3797b0b",
"assets/assets/images/woman-gardner-greenhouse_1.png": "4c914336c52bc046f7604ecb0e632dcd",
"assets/assets/lottie_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/pdfs/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/rive_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/videos/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/FontManifest.json": "6285e1b6989c19d87b9e13e5b76dfe37",
"assets/fonts/MaterialIcons-Regular.otf": "08724da1c0209ab478fe197f330be2cc",
"assets/NOTICES": "3f0c9808b095a928ce610b3abfef158b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/packages/flutter_google_places/assets/google_black.png": "97f2acfb6e993a0c4134d9d04dff21e2",
"assets/packages/flutter_google_places/assets/google_white.png": "40bc3ae5444eae0b9228d83bfd865158",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "bbc3a2d2265f7ff6bef4ba339a0ba4c9",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "dbf0a93d2b23d99b7af4b1a6ab94e122",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "4bc7849a5c7774cfa18e4bc2ef82404a",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"favicon.png": "2704101cb06ce66e2000356a312be25c",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"flutter.zip": "41cb70b52ffb5dbc6f5712db093368fa",
"flutter2.zip": "bbb8c9fbec9a1680c7c5c3d5cdd0b59a",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "485e5a2e0b334992772d53b99a48e0d4",
"/": "485e5a2e0b334992772d53b99a48e0d4",
"main.dart.js": "3265df30314991a105649c915fc933f8",
"manifest.json": "5cd42d748ce0eca5c682c614cfbe6461",
"style.css": "f6d84bd7659d207f52a67fa1873d43e7",
"version.json": "e11869ee1f9dca210c6ba5e36c947fab"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
