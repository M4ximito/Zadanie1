const http = require('http');

// Nazwisko autora serwera
const authorName = 'Maltsau';

// Funkcja do obsługi przychodzących żądań
function handleRequest(req, res) {
  const clientIP = req.connection.remoteAddress.replace('::ffff:', ''); // Adres IP klienta bez prefiksu ::ffff:
  const userAgent = req.headers['user-agent']; // User-Agent string

  // Zapis informacji o uruchomieniu serwera w logach
  console.log(`Serwer uruchomiony przez ${authorName} na porcie ${server.address().port}`);
  console.log(`Klient połączony z adresem IP: ${clientIP}`);

  // Określanie strefy czasowej klienta na podstawie jego adresu IP
  const clientTimezone = 'Europe/Warsaw';

  // Utworzenie obiektu daty i czasu dla bieżącej strefy czasowej
  const currentDate = new Date();
  const clientDateTime = new Intl.DateTimeFormat('default', {
    timeZone: clientTimezone,
    dateStyle: 'full',
    timeStyle: 'full'
  }).format(currentDate);

  // Wysyłanie odpowiedzi z informacjami o kliencie, jego strefie czasowej i używanym przeglądarce
  res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
  res.write('<html><body style="display:flex; flex-direction:column; align-items:center; justify-content:center; height:100vh; background-color:#f2f2f2; font-family: Arial, sans-serif;">');
  res.write(`<h1 style="margin-bottom: 20px; color:#333;">Adres IP: ${clientIP}</h1>`);
  res.write(`<p style="margin-bottom: 40px; color:#666; white-space: pre-wrap; word-break: break-word; text-align: center;">Current date and time in the time zone (${clientTimezone}):\n${clientDateTime}</p>`);
  res.write(`<p style="margin-bottom: 20px; color:#333;">Używana OS: ${getUserAgentInfo(userAgent)}</p>`);
  res.write(`<a href="https://github.com/M4ximito/Zadanie1" style="text-decoration: none; color:#007bff;">GitHub</a>`);
  res.write('</body></html>');
  res.end();
}

// Tworzenie serwera HTTP
const server = http.createServer(handleRequest);

// Uruchamianie serwera na porcie 3000
server.listen(3000, () => {
  console.log(`Serwer uruchomiony na porcie ${server.address().port}`);
});

// Funkcja do pobierania informacji o używanej przeglądarce na podstawie user-agent string
function getUserAgentInfo(userAgent) {
  const browserInfo = userAgent.match(/\(([^)]+)\)/)[1];
  return browserInfo.split(';')[0].trim();
}