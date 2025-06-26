<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rahmani FX Trader Pro</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <header>
        <h1>Rahmani FX Trader Pro</h1>
        <nav>
            <ul>
                <li><a href="#prices">Prices</a></li>
                <li><a href="#portfolio">Portfolio</a></li>
                <li><a href="#charts">Charts</a></li>
            </ul>
        </nav>
    </header>

    <section id="prices">
        <h2>Current Prices</h2>
        <div id="price-display">
            <p>Loading price...</p>
        </div>
    </section>

    <section id="charts">
        <h2>Bitcoin Price Chart</h2>
        <canvas id="priceChart" width="400" height="200"></canvas>
    </section>

    <footer>
        <p>&copy; 2025 Rahmani FX Trader Pro</p>
    </footer>

    <script>
        // Fetch the price data and update the display
        async function fetchPrice() {
            const res = await fetch('/price'); // Assuming you have an endpoint to get price
            const data = await res.json();
            if (data.bitcoin) {
                document.getElementById('price-display').innerHTML = `<p>Bitcoin: $${data.bitcoin.usd}</p>`;
            } else {
                document.getElementById('price-display').innerHTML = '<p>Error loading price.</p>';
            }
        }

        // Update the chart with live data
        async function fetchChartData() {
            const res = await fetch('/price');
            const data = await res.json();
            const priceData = Object.values(data.bitcoin);

            const ctx = document.getElementById('priceChart').getContext('2d');
            new Chart(ctx, {
                type: 'line',
                data: {
                    labels: priceData.map(() => new Date().toLocaleTimeString()),
                    datasets: [{
                        label: 'Bitcoin Price (USD)',
                        data: priceData,
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    }]
                }
            });
        }

        fetchPrice();
        fetchChartData();
        setInterval(fetchPrice, 10000); // Refresh price every 10 seconds
        setInterval(fetchChartData, 30000); // Update chart every 30 seconds
    </script>
</body>
</html>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login - Rahmani FX Trader Pro</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-5">
        <div class="card p-4 shadow">
          <h3 class="text-center">Login</h3>
          <form method="post">
            <div class="mb-3">
              <input class="form-control" name="username" placeholder="Username" required>
            </div>
            <div class="mb-3">
              <input class="form-control" type="password" name="password" placeholder="Password" required>
            </div>
            <button class="btn btn-primary w-100">Login</button>
          </form>
          <p class="text-center mt-3">No account? <a href="/register">Register</a></p>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Register - Rahmani FX Trader Pro</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-5">
        <div class="card p-4 shadow">
          <h3 class="text-center">Register</h3>
          <form method="post">
            <div class="mb-3">
              <input class="form-control" name="username" placeholder="Username" required>
            </div>
            <div class="mb-3">
              <input class="form-control" type="password" name="password" placeholder="Password" required>
            </div>
            <button class="btn btn-success w-100">Register</button>
          </form>
          <p class="text-center mt-3">Have an account? <a href="/login">Login</a></p>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Dashboard - Rahmani FX Trader Pro</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
  <nav class="navbar navbar-dark bg-dark">
    <div class="container-fluid">
      <span class="navbar-brand">Rahmani FX Trader Pro</span>
      <a class="btn btn-danger" href="/logout">Logout</a>
    </div>
  </nav>
  <div class="container mt-4">
    <h3>Welcome, {{ username }}</h3>
    <p>Balance: ${{ balance }}</p>
    <div class="card p-3 mb-3">
      <h5>Live Prices</h5>
      <ul>
        <li>BTC/USD: ${{ prices['BTC/USD'] }}</li>
        <!-- می‌توانید قیمت‌های دیگر را نیز اضافه کنید -->
      </ul>
    </div>
    <div class="card p-3 mb-3">
      <h5>Bitcoin Price Chart</h5>
      <canvas id="btcChart" width="400" height="200"></canvas>
    </div>
  </div>

  <script>
    const ctx = document.getElementById('btcChart').getContext('2d');
    const btcChart = new Chart(ctx, {
      type: 'line',
      data: {
        labels: ["10:00", "10:05", "10:10", "10:15", "10:20"],
        datasets: [{
          label: "BTC/USD",
          data: [67800, 67880, 67920, 67850, 68010],
          borderColor: "blue",
          backgroundColor: "rgba(0,0,255,0.1)"
        }]
      },
      options: {
        responsive: true,
        scales: {
          x: { title: { display: true, text: 'Time' } },
          y: { title: { display: true, text: 'Price (USD)' } }
        }
      }
    });
  </script>
</body>
</html>

