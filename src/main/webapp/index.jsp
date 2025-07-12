<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>PATIL_GYM_index</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: 'Arial', sans-serif;
      color: #fff;
      background-color: #000;
      scroll-behavior: smooth;
    }


    .hero-container {
      position: relative;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      text-align: center;
      background-image: url('https://wallpapercave.com/wp/wp8235128.jpg');
      background-size: cover;
      background-position: center;
    }

    .hero-container::before {
      content: '';
      position: absolute;
      inset: 0;
      background-color: rgba(0, 0, 0, 0.6);
      z-index: 1;
    }

    .hero-container > * {
      position: relative;
      z-index: 2;
    }

    .welcome-text {
      font-size: 2rem;
      font-weight: bold;
      color: #4fa3f7;
      margin-bottom: 40px;
    }

    .login-container {
      background-color: rgba(0, 0, 0, 0.7);
      padding: 20px;
      border-radius: 10px;
      width: 200px;
      display: flex;
      flex-direction: column;
      gap: 20px;
      box-shadow: 0 6px 18px rgba(0, 0, 0, 0.3);
      text-align: center;
    }

    .login-container a {
      display: flex;
      flex-direction: column;
      align-items: center;
      color: #fff;
      font-size: 18px;
      font-weight: bold;
      margin: 10px 0;
      text-decoration: none;
      transition: color 0.3s ease;
    }

    .login-container a img {
      width: 40px;
      height: 40px;
      margin-bottom: 10px;
      border-radius: 50%;
    }

    .login-container a:hover {
      color: #4fa3f7;
    }

    .scroll-down {
      margin-top: 30px;
      color: #4fa3f7;
      font-size: 24px;
      text-decoration: none;
      animation: bounce 1.5s infinite;
    }

    @keyframes bounce {
      0%, 100% {
        transform: translateY(0);
      }
      50% {
        transform: translateY(10px);
      }
    }


    .card-container {
      display: flex;
      justify-content: center;
      gap: 20px;
      min-height: 100vh;
      flex-wrap: wrap;
      padding: 60px 30px;
      background-color: #000;
    }

    .package-card {
      color: white;
      border-radius: 10px;
      padding: 20px;
      width: 250px;
      text-align: center;
      box-shadow: 0 6px 18px rgba(0, 0, 0, 0.3);
      transition: transform 0.5s ease, box-shadow 0.3s ease;
    }

    .package-card.premium {
      background: linear-gradient(45deg, rgba(51, 51, 51, 0.9), rgba(79, 79, 79, 0.8));
    }

    .package-card.pro {
      background: linear-gradient(45deg, rgba(44, 44, 44, 0.9), rgba(32, 32, 32, 0.8));
    }

    .package-card.basic {
      background: linear-gradient(45deg, rgba(55, 55, 55, 0.9), rgba(67, 67, 67, 0.8));
    }

    .package-card.vip {
      background: linear-gradient(45deg, rgba(30, 30, 30, 0.9), rgba(25, 25, 25, 0.8));
    }

    .package-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.4);
    }

    .package-title {
      font-size: 1.5rem;
      font-weight: bold;
      margin-bottom: 20px;
    }

    .package-description {
      font-size: 1rem;
      margin-bottom: 20px;
    }

    footer {
      background-color: #292929;
      color: white;
      padding: 20px;
      text-align: center;
    }
  </style>
</head>
<body>


  <div class="hero-container">
    <div class="welcome-text">Welcome to the Fitness World!</div>
    <div class="login-container">

      <a href="AdminLogin.jsp">
        <img src="https://th.bing.com/th?q=User+Login+Icon.png&w=120&h=120" alt="Admin Login Icon"/>
        <span>Admin Login</span>
      </a>
    </div>
    <a href="#packages" class="scroll-down"></a>
  </div>


  <div class="card-container" id="packages">
    <div class="package-card premium">
      <div class="package-title">Premium</div>
      <div class="package-description">All features included with extra benefits. Best for dedicated fitness enthusiasts.</div>
    </div>
    <div class="package-card pro">
      <div class="package-title">Pro</div>
      <div class="package-description">Ideal for those looking for a balanced workout routine with professional guidance.</div>
    </div>
    <div class="package-card basic">
      <div class="package-title">Basic</div>
      <div class="package-description">Great for beginners. Start your fitness journey with essential features.</div>
    </div>
    <div class="package-card vip">
      <div class="package-title">VIP</div>
      <div class="package-description">Exclusive access to the best services and personal training sessions for VIP members.</div>
    </div>
  </div>


  <footer>
    <p>&copy; 2025 PATIL GYM | All Rights Reserved</p>
  </footer>


  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
