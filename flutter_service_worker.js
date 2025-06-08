'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"canvaskit/canvaskit.wasm": "a37f2b0af4995714de856e21e882325c",
"canvaskit/chromium/canvaskit.wasm": "c054c2c892172308ca5a0bd1d7a7754b",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "f7c5e5502d577306fb6d530b1864ff86",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/skwasm.js.symbols": "9fe690d47b904d72c7d020bd303adf16",
"canvaskit/skwasm.wasm": "1c93738510f202d9ff44d36a4760126b",
"canvaskit/canvaskit.js.symbols": "27361387bc24144b46a745f1afe92b50",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "f1126486ccebd15d203af7169b536fc2",
"assets/AssetManifest.bin": "96c25b85b598022b6a779d129d41ea15",
"assets/fonts/MaterialIcons-Regular.otf": "c0ad29d56cfe3890223c02da3c6e0448",
"assets/AssetManifest.json": "eae69e2c0fe1036faf7e12b1ad70fe5f",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/assets/spiderman.jpg": "cf31b5a19b17e4ff1544b3a7f3e4e592",
"assets/assets/batman.jpg": "38449123155451ab59453a5dbf28144f",
"assets/assets/avengers.jpg": "ef7ef8888807446293858f9aa48beb0c",
"assets/assets/british.jpg": "d7e1847f2aace11da0b6f11b62cc7325",
"assets/assets/horror.jpg": "fa00d8e65cac5955bdcb4f20a004acf2",
"assets/assets/pixar.jpg": "abb6238a388f5f61de7e27f9255eb279",
"assets/assets/scream.jpg": "480e5b2d0f740fd5086ba88885e967a1",
"assets/assets/download.jpg": "a4c601d380cab18770a7428af888a25b",
"assets/assets/hangover.jpg": "18440e62f55210048dd0f27fc6960935",
"assets/assets/superman.jpg": "7d06ad6eed6418299d724dea9061b662",
"assets/assets/toystory.jpg": "f949e80133e81b48c5c54bdc66674ec3",
"assets/assets/halloween.jpg": "3ece892b6c62b11e41c1afcf3c288503",
"assets/assets/my_map.csv": "13d8192d76205b6aa8314df88fc22475",
"assets/assets/joker.jpg": "1b7c1c513e7a6401cefcc58657880fd9",
"assets/assets/dark.jpg": "419659c5d71c738ba73f58c7153bafc3",
"assets/assets/ironman.jpg": "09fd9082c560dd2ccb835ca08599f215",
"assets/assets/marvel.jpg": "bfe58b3496b20d9dba293c11f6783e0f",
"assets/assets/begins.jpg": "0d460e2ec4f2bd3dc66ed4acaadb7b56",
"assets/assets/classic.jpg": "d2f72a2941c4468f1c243b7ed9c11143",
"assets/assets/exorcist.jpg": "7ddd0dcca16831d644b0718b7db75176",
"assets/assets/action.jpg": "3ecfa5f2423eade6938fd4f90b7e3305",
"assets/assets/psycho.jpg": "546e6492eb68a72c72e9500652ca749a",
"assets/assets/superhero.jpg": "54df9cba392540139ea768184f4b775f",
"assets/assets/team.jpg": "8cec4b276bf0004fa7328ff937dd3a27",
"assets/assets/lionking.jpg": "792636eeb10bbec3dc82e6129fed02e7",
"assets/assets/nottinghill.jpg": "e2762b4bdc104b47dc8b595772a2c8ad",
"assets/assets/endgame.jpg": "205150b226eef26bec264f68050484c1",
"assets/assets/romcom.jpg": "fa498af73dc5863d28cee3d7fd3298b0",
"assets/assets/animated.jpg": "8b510548ef7dbd77a37b0340631be2fd",
"assets/assets/proposal.jpg": "4c43b0e9ff7f647b7e112e203d521bb3",
"assets/assets/terr.jpg": "9e390bfc1f71b90a4539b07f51bef72f",
"assets/assets/comedy.jpg": "a91d885229c1b95b37668133dc9a3304",
"assets/assets/slasher.jpg": "af33ac6cb40297c612e24eff3583f2ab",
"assets/assets/darknight.jpg": "4dc21709c027cc0effcab56860279fd4",
"assets/assets/ann.jpg": "14caac49ea4b562881613cc9613710f3",
"assets/assets/superman2.jpg": "946c1e5e00db0ae0f162ae7b46cb07f4",
"assets/assets/phy.jpg": "5152a9248cc3854073ea02cfbb1497af",
"assets/assets/cinema.jpg": "bf09fa44d24054b33c6d0c4574f9ae80",
"assets/NOTICES": "74d0585d69e58e4a7bb3f438c24f625b",
"assets/AssetManifest.bin.json": "ca4c31ccc055af9e4ec610fc9700bd71",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"manifest.json": "f69077c63d58dc632547d324056f947b",
"index.html": "fd523315954fb0006cee40a64d6c0c60",
"/": "fd523315954fb0006cee40a64d6c0c60",
"version.json": "140fe6951f41b220f2909b82f37044df",
"flutter_bootstrap.js": "32eec31216a1898707fd35edc4286aaa",
"main.dart.js": "457d2841bf88a63bf7c8113108152bae",
"favicon.png": "5dcef449791fa27946b3d35ad8803796"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
