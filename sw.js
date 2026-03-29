const CACHE='flowstate-v1'; 
const FILES=['./'];
FILES.push('./index.html','./clock.html','./stopwatch.html','./timer.html');
FILES.push('./pomodoro.html','./schedule.html','./tasks.html','./notes.html');
FILES.push('./habits.html','./insights.html','./styles.css','./app.js','./manifest.json');
self.addEventListener('install',e=>{e.waitUntil(caches.open(CACHE).then(c=>c.addAll(FILES)));self.skipWaiting()});
self.addEventListener('activate',e=>self.clients.claim());
self.addEventListener('fetch',e=>e.respondWith(caches.match(e.request).then(r=>r||fetch(e.request))));
