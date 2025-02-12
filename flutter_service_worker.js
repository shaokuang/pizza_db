'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  ".git/COMMIT_EDITMSG": "e72b7b5e17e0915f4bcc856a3cbf5081",
".git/config": "c59fd27bba1d67a4f62dca742ca5e513",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "9641028b0a113366603a41a6a8031612",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "ea587b0fae70333bce92257152996e70",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "1a10f3a9a126355c348973ca20fa44d3",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "9f4211d33192caa6ee7125d8bb2de618",
".git/logs/refs/heads/main": "9f4211d33192caa6ee7125d8bb2de618",
".git/logs/refs/remotes/origin/HEAD": "e8479bea2850ad0018acd0284192ba0a",
".git/logs/refs/remotes/origin/main": "c337dbbc98c7ef51f2998ce1273b4777",
".git/objects/09/d12bf6022cdada2ec04b82170c23aa9b45e697": "89d3847222682c85949cc50ffa012941",
".git/objects/0c/d80b48e2a0332616e038afa3cc4bf2ce58f537": "7029cba0813cfc04cae92fc49e1b5e14",
".git/objects/2f/e0abd6c58e2e2bf36bab8db37c74e43feb2994": "77601eb7900dc92b2cac86bf12a96ee9",
".git/objects/32/871e7d997274bf481b2e587e05b280939baba8": "f9e9f6ade43c87bd844e6adbeb30d35b",
".git/objects/37/528f28544179e3ec5f034115d36de737245d22": "eacc21d7d62f1b41b27cdf13ac38e381",
".git/objects/3b/e42233428289479e51c57ccaab8c72864ef31a": "a811b0133bbbb1f61bf3f45fa88ea37d",
".git/objects/46/24c1abe5b459d18ce9ef71598ff5e721974f9d": "4b4fc3f468551535cff53b662478899d",
".git/objects/47/81d23781bddd0dbd436151fe6aed44cd29c095": "720c206fd593727907e76a4f150f5da9",
".git/objects/4d/2fd901b8f28b69ea6e31d6b9a58a49f3540520": "5f93c970b0c1fe6002a86024e08227b6",
".git/objects/61/4d353c06f5f63850b9afffb25f170520a7e386": "c09d2190a4d60d1d48edeff88ff72994",
".git/objects/63/61eb1ff783b0c4f8e806902353c4cdcc80535d": "0c634cb351dc732e70d8fd5ef22c440c",
".git/objects/75/8e2bba8ad506a44b4060ab13a886be9301a3bf": "2b7c22d367e60c9004ad612189cb718a",
".git/objects/88/686a484ac192ebd151cc9dc1a52bd59915265b": "9e0af51ed7a8a7e2dfb7af5afa0c0cd6",
".git/objects/91/2631774931599bbae5731931f3d905c6580826": "a4d5ca3e20c15853115c13ba60be41b3",
".git/objects/a8/2fd6668d001700657735a6aa64d650b7393730": "9549d862f7bfc509699493f27f84742f",
".git/objects/ab/ecc0531b8a0472008b73dbde439994c35152de": "8b9e87d4377503f82172437e26877f3f",
".git/objects/b2/e8f4ae83aad489ca3bf5e117624f7fc23cfad2": "2928061822841c04534ee5a3a29272e5",
".git/objects/b2/fff6010c936eeb8a2189e707f9b71e87640ccf": "781c35eb58be82d78721b1104292512c",
".git/objects/d9/a1b5aec528fd33401d2d161ac6ac9ce7520406": "7ad7c85cfbf1c7a55070d3d45fe88e8f",
".git/objects/e1/ecd7fecf87435ccc71d6ec1dc308c89b7fdb76": "f31041538b134dc9e901582c3775662d",
".git/objects/ff/1da730d947b45ccffe985f61d9ed1269c6cffc": "9ece6cf87a722c809b42470b4e2a575e",
".git/objects/pack/pack-902305bc6d4b0d78cc27ac9dd51067b83b1c709e.idx": "fb93d2de717603c7a7085804d0d8f8d6",
".git/objects/pack/pack-902305bc6d4b0d78cc27ac9dd51067b83b1c709e.pack": "b6c6714f6852b477f84e71ce39f909c2",
".git/packed-refs": "b00dd22cb61b5f4d1ff1ae4456c94f8f",
".git/refs/heads/main": "b032a609cbd3c081b5d6e17ad5f8fc37",
".git/refs/remotes/origin/HEAD": "98b16e0b650190870f1b40bc8f4aec4e",
".git/refs/remotes/origin/main": "b032a609cbd3c081b5d6e17ad5f8fc37",
"assets/AssetManifest.json": "2efbb41d7877d10aac9d091f58ccd7b9",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "acda5996ca44bc8aad897c1dde877ae1",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "b14fcf3ee94e3ace300b192e9e7c8c5d",
"assets/shaders/ink_sparkle.frag": "766c8cc582887d79fd06bb0d7caf09e0",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "96591e0fe2abef345034e5ca0ba97d83",
"/": "96591e0fe2abef345034e5ca0ba97d83",
"main.dart.js": "37eb4e419b8d5069ca8c68cc1920a80a",
"manifest.json": "440d436d2816114b373f072a5107f507",
"version.json": "8360b4298afee22c7a9ed42859b2da68"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
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
