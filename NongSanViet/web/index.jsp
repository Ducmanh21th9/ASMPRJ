<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nông Sản Việt - Tinh hoa đất Việt</title>
    
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    
    <!-- CSS TRỰC TIẾP TRONG FILE -->
    <style>
        /* ===== RESET & BASE ===== */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        /* Fix lệch chữ trong product card */
        
.product-card { display: flex; flex-direction: column; }
.product-info { display: flex; flex-direction: column; gap: 8px; }
.product-category { display: inline-block; line-height: 1.2; }
.product-name { line-height: 1.25; margin: 0; min-height: 52px; }   /* giữ chiều cao đều cho tên */
.product-description { line-height: 1.5; margin: 0; min-height: 46px; } /* giữ đều phần mô tả */
.product-price { margin-top: 6px; }
.product-link { margin-top: 8px; display: inline-flex; gap: 8px; align-items: center; }
        :root {
            --primary-green: #2c5f2d;
            --primary-green-light: #3a7b3a;
            --primary-green-dark: #1a3b1a;
            --accent-yellow: #ffd93d;
            --accent-yellow-dark: #ffd32a;
            --text-dark: #333333;
            --text-light: #666666;
            --text-lighter: #999999;
            --white: #ffffff;
            --off-white: #faf7f2;
            --gray-light: #e0e0e0;
            --gray-lighter: #f5f5f5;
            --red: #ff4444;
            --shadow: 0 5px 20px rgba(0,0,0,0.1);
            --shadow-hover: 0 10px 30px rgba(0,0,0,0.15);
            --transition: all 0.3s ease;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: 'Inter', sans-serif;
            line-height: 1.6;
            color: var(--text-dark);
            background-color: var(--white);
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        ul {
            list-style: none;
        }

        img {
            max-width: 100%;
            height: auto;
            display: block;
        }

        /* ===== HEADER & NAVIGATION ===== */
        .header {
            background-color: var(--primary-green);
            padding: 1rem 2rem;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: var(--shadow);
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1400px;
            margin: 0 auto;
            gap: 2rem;
        }

        .nav-brand h1 {
            color: var(--accent-yellow);
            font-size: 1.8rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: var(--transition);
        }

        .nav-brand h1:hover {
            transform: scale(1.05);
        }

        .nav-brand i {
            font-size: 2rem;
        }

        .nav-menu {
            display: flex;
            gap: 2rem;
        }

        .nav-menu a {
            color: var(--white);
            font-weight: 600;
            font-size: 1rem;
            letter-spacing: 0.5px;
            padding: 0.5rem 0;
            position: relative;
            transition: var(--transition);
        }

        .nav-menu a::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 0;
            height: 3px;
            background-color: var(--accent-yellow);
            transition: var(--transition);
        }

        .nav-menu a:hover::after,
        .nav-menu a.active::after {
            width: 100%;
        }

        .nav-menu a:hover,
        .nav-menu a.active {
            color: var(--accent-yellow);
            transform: translateY(-2px);
        }

        .nav-icons {
            display: flex;
            gap: 1.5rem;
        }

        .nav-icons a {
            color: var(--white);
            font-size: 1.3rem;
            transition: var(--transition);
            position: relative;
        }

        .nav-icons a:hover {
            color: var(--accent-yellow);
            transform: translateY(-3px) rotate(5deg);
        }

        .nav-icons a::after {
            content: attr(data-count);
            position: absolute;
            top: -8px;
            right: -8px;
            background: var(--red);
            color: var(--white);
            font-size: 0.7rem;
            padding: 2px 6px;
            border-radius: 50%;
            opacity: 0;
            transition: var(--transition);
        }

        .nav-icons a:hover::after {
            opacity: 1;
        }

        /* ===== HERO SECTION ===== */
        .hero {
            background: linear-gradient(135deg, rgba(44,95,45,0.9), rgba(26,59,26,0.9)), 
                        url('https://tse4.mm.bing.net/th?id=OIF.3OFInHoI%2f8ipnLozzWmfZw&w=282&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            min-height: 650px;
            display: flex;
            align-items: center;
            padding: 0 2rem;
            position: relative;
            overflow: hidden;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNjAiIGhlaWdodD0iNjAiIHZpZXdCb3g9IjAgMCA2MCA2MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48cGF0aCBkPSJNMzAgMTBsMTAgMTcuMzJIMjB6IiBmaWxsPSJyZ2JhKDI1NSwyNTUsMjU1LDAuMDUpIi8+PC9zdmc+');
            opacity: 0.1;
            animation: float 20s linear infinite;
        }

        @keyframes float {
            from { transform: rotate(0deg) scale(1); }
            to { transform: rotate(360deg) scale(1.2); }
        }

        .hero-content {
            max-width: 700px;
            color: var(--white);
            position: relative;
            z-index: 2;
            animation: slideInLeft 1s ease;
        }

        @keyframes slideInLeft {
            from {
                opacity: 0;
                transform: translateX(-100px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .hero-badge {
            background: var(--accent-yellow);
            color: var(--primary-green);
            padding: 0.6rem 1.8rem;
            border-radius: 50px;
            font-weight: 700;
            font-size: 0.9rem;
            display: inline-block;
            margin-bottom: 2rem;
            text-transform: uppercase;
            letter-spacing: 2px;
            animation: pulse 2s infinite;
            box-shadow: 0 5px 15px rgba(255,217,61,0.3);
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        .hero-title {
            font-size: 5rem;
            line-height: 1.1;
            margin-bottom: 1.5rem;
            font-weight: 800;
            text-shadow: 3px 3px 6px rgba(0,0,0,0.3);
        }

        .hero-title span {
            color: var(--accent-yellow);
            display: inline-block;
            animation: bounce 2s infinite;
        }

        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        .hero-description {
            font-size: 1.2rem;
            margin-bottom: 2.5rem;
            line-height: 1.8;
            max-width: 600px;
            opacity: 0.95;
        }

        .hero-buttons {
            display: flex;
            gap: 1.5rem;
        }

        .btn {
            padding: 1rem 2.8rem;
            border-radius: 50px;
            font-weight: 700;
            transition: var(--transition);
            display: inline-block;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 0.9rem;
            border: none;
            cursor: pointer;
            position: relative;
            overflow: hidden;
            z-index: 1;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: rgba(255,255,255,0.2);
            transition: var(--transition);
            z-index: -1;
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn-primary {
            background: var(--accent-yellow);
            color: var(--primary-green);
            box-shadow: 0 5px 15px rgba(255,217,61,0.4);
        }

        .btn-primary:hover {
            background: var(--accent-yellow-dark);
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(255,217,61,0.6);
        }

        .btn-secondary {
            background: transparent;
            color: var(--white);
            border: 2px solid var(--white);
            box-shadow: 0 5px 15px rgba(255,255,255,0.2);
        }

        .btn-secondary:hover {
            background: var(--white);
            color: var(--primary-green);
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(255,255,255,0.4);
        }

        /* ===== CATEGORIES SECTION ===== */
        .categories {
            padding: 6rem 0;
            background: linear-gradient(135deg, var(--white), var(--off-white));
            position: relative;
        }

        .categories::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 100px;
            background: linear-gradient(to bottom, rgba(44,95,45,0.05), transparent);
        }

        .section-header {
            text-align: center;
            margin-bottom: 4rem;
            position: relative;
        }

        .section-badge {
            background: linear-gradient(135deg, var(--primary-green), var(--primary-green-dark));
            color: var(--white);
            padding: 0.6rem 2rem;
            border-radius: 50px;
            font-weight: 700;
            font-size: 0.9rem;
            display: inline-block;
            margin-bottom: 1.5rem;
            text-transform: uppercase;
            letter-spacing: 2px;
            box-shadow: 0 5px 15px rgba(44,95,45,0.3);
            animation: shimmer 3s infinite;
        }

        @keyframes shimmer {
            0% { background-position: -100% 0; }
            100% { background-position: 200% 0; }
        }

        .section-header h2 {
            font-size: 3rem;
            color: var(--primary-green);
            font-weight: 800;
            margin-bottom: 1rem;
            position: relative;
            display: inline-block;
        }

        .section-header h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: linear-gradient(90deg, var(--accent-yellow), var(--primary-green));
            border-radius: 2px;
            animation: expandWidth 2s infinite;
        }

        @keyframes expandWidth {
            0% { width: 80px; }
            50% { width: 150px; }
            100% { width: 80px; }
        }

        .section-header p {
            color: var(--text-light);
            font-size: 1.2rem;
            max-width: 700px;
            margin: 1.5rem auto 0;
            line-height: 1.8;
        }

        .category-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 2.5rem;
            position: relative;
            z-index: 2;
        }

        .category-item {
            background: var(--white);
            padding: 2.5rem 2rem;
            border-radius: 20px;
            text-align: center;
            transition: var(--transition);
            border: 1px solid var(--gray-light);
            cursor: pointer;
            position: relative;
            overflow: hidden;
            box-shadow: var(--shadow);
        }

        .category-item::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: linear-gradient(90deg, var(--accent-yellow), var(--primary-green));
            transform: translateX(-100%);
            transition: var(--transition);
        }

        .category-item:hover::before {
            transform: translateX(0);
        }

        .category-item:hover {
            transform: translateY(-15px);
            box-shadow: var(--shadow-hover);
            border-color: var(--primary-green);
        }

        .category-icon {
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, rgba(44,95,45,0.1), rgba(255,217,61,0.1));
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.8rem;
            transition: var(--transition);
            position: relative;
        }

        .category-icon::after {
            content: '';
            position: absolute;
            top: -5px;
            left: -5px;
            right: -5px;
            bottom: -5px;
            border: 2px dashed var(--accent-yellow);
            border-radius: 50%;
            opacity: 0;
            transition: var(--transition);
        }

        .category-item:hover .category-icon::after {
            opacity: 1;
            animation: rotate 10s linear infinite;
        }

        .category-item:hover .category-icon {
            background: var(--primary-green);
            transform: rotateY(360deg) scale(1.1);
        }

        .category-item:hover .category-icon i {
            color: var(--white);
            transform: scale(1.2);
        }

        .category-icon i {
            font-size: 3rem;
            color: var(--primary-green);
            transition: var(--transition);
        }

        .category-item h3 {
            color: var(--text-dark);
            font-size: 1.5rem;
            margin-bottom: 0.8rem;
            font-weight: 700;
        }

        .category-item p {
            color: var(--text-light);
            font-size: 1rem;
            line-height: 1.6;
        }

        /* ===== FEATURED PRODUCTS ===== */
        .featured-products {
            padding: 6rem 0;
            background: linear-gradient(135deg, var(--off-white), var(--white));
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 2.5rem;
        }

        .product-card {
            background: var(--white);
            border-radius: 20px;
            overflow: hidden;
            position: relative;
            transition: var(--transition);
            box-shadow: var(--shadow);
            border: 1px solid var(--gray-light);
            animation: fadeInUp 0.5s ease;
            animation-fill-mode: both;
        }

        .product-card:nth-child(1) { animation-delay: 0.1s; }
        .product-card:nth-child(2) { animation-delay: 0.2s; }
        .product-card:nth-child(3) { animation-delay: 0.3s; }
        .product-card:nth-child(4) { animation-delay: 0.4s; }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .product-card:hover {
            transform: translateY(-15px) scale(1.02);
            box-shadow: var(--shadow-hover);
            border-color: var(--primary-green);
        }

        .product-tag {
            position: absolute;
            top: 1.2rem;
            right: 1.2rem;
            background: linear-gradient(135deg, var(--red), #ff6b6b);
            color: var(--white);
            padding: 0.5rem 1.2rem;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 700;
            z-index: 2;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            box-shadow: 0 3px 10px rgba(255,68,68,0.3);
            animation: pulse 2s infinite;
        }

        .product-image {
            height: 280px;
            overflow: hidden;
            position: relative;
        }

        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .product-card:hover .product-image img {
            transform: scale(1.15);
        }

        .product-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(44,95,45,0.9), rgba(26,59,26,0.9));
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 1.5rem;
            opacity: 0;
            transition: var(--transition);
            backdrop-filter: blur(3px);
        }

        .product-card:hover .product-overlay {
            opacity: 1;
        }

        .product-overlay a {
            width: 55px;
            height: 55px;
            background: var(--white);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary-green);
            font-size: 1.3rem;
            transform: translateY(30px);
            transition: var(--transition);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .product-card:hover .product-overlay a {
            transform: translateY(0);
        }

        .product-overlay a:hover {
            background: var(--accent-yellow);
            color: var(--primary-green-dark);
            transform: translateY(-5px) scale(1.1);
        }

        .product-overlay a:nth-child(1) { transition-delay: 0.1s; }
        .product-overlay a:nth-child(2) { transition-delay: 0.2s; }

        .product-info {
            padding: 2rem;
        }

        .product-category {
            color: var(--primary-green);
            font-weight: 700;
            font-size: 0.85rem;
            margin-bottom: 0.8rem;
            letter-spacing: 1px;
            text-transform: uppercase;
            display: inline-block;
            background: linear-gradient(135deg, rgba(44,95,45,0.1), rgba(255,217,61,0.1));
            padding: 0.3rem 1.2rem;
            border-radius: 50px;
        }

        .product-name {
            font-size: 1.3rem;
            margin-bottom: 0.8rem;
            color: var(--text-dark);
            font-weight: 700;
            line-height: 1.4;
        }

        .product-description {
            color: var(--text-light);
            font-size: 0.95rem;
            margin-bottom: 1rem;
            line-height: 1.6;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .product-price {
            margin-bottom: 1rem;
        }

        .price {
            color: var(--primary-green);
            font-size: 1.4rem;
            font-weight: 800;
        }

        .old-price {
            color: var(--text-lighter);
            text-decoration: line-through;
            font-size: 1rem;
            margin-left: 0.5rem;
        }

        .product-rating {
            display: flex;
            align-items: center;
            gap: 0.2rem;
            margin: 1rem 0;
        }

        .product-rating i {
            color: #ffc107;
            font-size: 1rem;
            transition: var(--transition);
        }

        .product-rating i:hover {
            transform: scale(1.2);
        }

        .product-rating span {
            color: var(--text-light);
            font-size: 0.9rem;
            margin-left: 0.5rem;
        }

        .product-link {
            color: var(--primary-green);
            font-weight: 700;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.8rem;
            transition: var(--transition);
            font-size: 1rem;
            position: relative;
            padding-bottom: 3px;
        }

        .product-link::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--accent-yellow);
            transition: var(--transition);
        }

        .product-link:hover::after {
            width: 100%;
        }

        .product-link:hover {
            color: var(--accent-yellow);
            gap: 1.2rem;
        }

        .product-link i {
            transition: var(--transition);
        }

        .product-link:hover i {
            transform: translateX(5px);
        }

        /* ===== NEWSLETTER SECTION ===== */
        .newsletter {
            background: linear-gradient(135deg, var(--primary-green), var(--primary-green-dark));
            color: var(--white);
            padding: 5rem 0;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .newsletter::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            animation: rotate 30s linear infinite;
        }

        .newsletter::after {
            content: '';
            position: absolute;
            bottom: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,217,61,0.1) 0%, transparent 70%);
            animation: rotate 40s linear infinite reverse;
        }

        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .newsletter-content {
            position: relative;
            z-index: 2;
            max-width: 700px;
            margin: 0 auto;
        }

        .newsletter h2 {
            font-size: 3rem;
            margin-bottom: 1rem;
            font-weight: 800;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
            animation: slideInDown 1s ease;
        }

        @keyframes slideInDown {
            from {
                opacity: 0;
                transform: translateY(-50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .newsletter p {
            font-size: 1.2rem;
            margin-bottom: 2.5rem;
            opacity: 0.95;
            line-height: 1.8;
            animation: slideInUp 1s ease 0.2s both;
        }

        .newsletter-form {
            display: flex;
            max-width: 600px;
            margin: 0 auto;
            gap: 1rem;
            animation: slideInUp 1s ease 0.4s both;
        }

        .newsletter-form input {
            flex: 1;
            padding: 1.2rem 1.8rem;
            border: none;
            border-radius: 50px;
            font-size: 1rem;
            outline: none;
            transition: var(--transition);
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }

        .newsletter-form input:focus {
            transform: scale(1.02);
            box-shadow: 0 5px 30px rgba(255,217,61,0.4);
        }

        .newsletter-form input::placeholder {
            color: var(--text-lighter);
            font-style: italic;
        }

        .newsletter-form .btn-primary {
            padding: 1.2rem 2.5rem;
            font-size: 1rem;
            background: var(--accent-yellow);
            color: var(--primary-green);
            border: none;
            font-weight: 700;
            box-shadow: 0 5px 20px rgba(255,217,61,0.3);
        }

        .newsletter-form .btn-primary:hover {
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 8px 30px rgba(255,217,61,0.5);
        }

        /* ===== FOOTER ===== */
        .footer {
            background: linear-gradient(135deg, var(--primary-green-dark), #0f2a0f);
            color: var(--white);
            padding: 5rem 0 2rem;
            position: relative;
        }

        .footer::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 3px;
            background: linear-gradient(90deg, transparent, var(--accent-yellow), transparent);
        }

        .footer-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 3rem;
            margin-bottom: 4rem;
        }

        .footer-about {
            animation: slideInLeft 1s ease;
        }

        .footer-links {
            animation: slideInLeft 1s ease 0.1s both;
        }

        .footer-support {
            animation: slideInLeft 1s ease 0.2s both;
        }

        .footer-contact {
            animation: slideInLeft 1s ease 0.3s both;
        }

        .footer h4 {
            font-size: 1.8rem;
            margin-bottom: 1.5rem;
            color: var(--accent-yellow);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .footer h4 i {
            font-size: 2rem;
            animation: spin 10s linear infinite;
        }

        @keyframes spin {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .footer h5 {
            font-size: 1.2rem;
            margin-bottom: 1.5rem;
            color: var(--accent-yellow);
            position: relative;
            padding-bottom: 0.8rem;
        }

        .footer h5::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 50px;
            height: 3px;
            background: linear-gradient(90deg, var(--accent-yellow), transparent);
            border-radius: 2px;
            animation: expandWidth 3s infinite;
        }

        .footer p {
            color: #b0b0b0;
            line-height: 1.8;
            margin-bottom: 1.5rem;
        }

        .footer ul {
            list-style: none;
        }

        .footer ul li {
            margin-bottom: 0.8rem;
        }

        .footer ul li a {
            color: #b0b0b0;
            text-decoration: none;
            transition: var(--transition);
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .footer ul li a::before {
            content: '→';
            opacity: 0;
            transform: translateX(-10px);
            transition: var(--transition);
        }

        .footer ul li a:hover::before {
            opacity: 1;
            transform: translateX(0);
        }

        .footer ul li a:hover {
            color: var(--accent-yellow);
            transform: translateX(10px);
        }

        .footer address p {
            margin-bottom: 0.8rem;
            display: flex;
            align-items: center;
            gap: 0.8rem;
            transition: var(--transition);
        }

        .footer address p:hover {
            transform: translateX(5px);
            color: var(--white);
        }

        .footer address p:hover i {
            color: var(--accent-yellow);
            transform: scale(1.2);
        }

        .footer address i {
            color: var(--accent-yellow);
            width: 25px;
            font-size: 1.1rem;
            transition: var(--transition);
        }

        .social-links {
            display: flex;
            gap: 1.2rem;
            margin-top: 2rem;
        }

        .social-links a {
            width: 45px;
            height: 45px;
            background: rgba(255,255,255,0.05);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
        }

        .social-links a::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: var(--accent-yellow);
            transform: scale(0);
            transition: var(--transition);
            border-radius: 50%;
        }

        .social-links a:hover::before {
            transform: scale(1);
        }

        .social-links i {
            color: var(--white);
            font-size: 1.2rem;
            transition: var(--transition);
            position: relative;
            z-index: 2;
        }

        .social-links a:hover i {
            color: var(--primary-green-dark);
            transform: scale(1.2);
        }

        .footer-bottom {
            border-top: 1px solid rgba(255,255,255,0.1);
            padding-top: 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .footer-bottom p {
            color: #b0b0b0;
            margin: 0;
            animation: pulse 3s infinite;
        }

        .footer-legal {
            display: flex;
            gap: 2rem;
        }

        .footer-legal a {
            color: #b0b0b0;
            text-decoration: none;
            font-size: 0.9rem;
            transition: var(--transition);
            position: relative;
        }

        .footer-legal a::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 1px;
            background: var(--accent-yellow);
            transition: var(--transition);
        }

        .footer-legal a:hover::after {
            width: 100%;
        }

        .footer-legal a:hover {
            color: var(--accent-yellow);
        }

        /* ===== BACK TO TOP BUTTON ===== */
        #backToTop {
            position: fixed;
            bottom: 40px;
            right: 40px;
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, var(--primary-green), var(--primary-green-dark));
            color: var(--white);
            border: none;
            border-radius: 50%;
            cursor: pointer;
            font-size: 1.3rem;
            opacity: 0;
            visibility: hidden;
            transition: var(--transition);
            z-index: 99;
            box-shadow: 0 5px 20px rgba(44,95,45,0.4);
            transform: scale(0) rotate(0deg);
            border: 2px solid var(--accent-yellow);
        }

        #backToTop.show {
            opacity: 1;
            visibility: visible;
            transform: scale(1) rotate(360deg);
            animation: bounce 2s infinite;
        }

        #backToTop:hover {
            background: var(--accent-yellow);
            color: var(--primary-green);
            transform: scale(1.1) rotate(180deg);
            border-color: var(--white);
        }

        /* ===== RESPONSIVE DESIGN ===== */
        @media (max-width: 1200px) {
            .hero-title {
                font-size: 4rem;
            }
            
            .category-grid,
            .product-grid,
            .footer-grid {
                grid-template-columns: repeat(3, 1fr);
                gap: 2rem;
            }
        }

        @media (max-width: 992px) {
            .hero-title {
                font-size: 3.5rem;
            }
            
            .category-grid,
            .product-grid,
            .footer-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                gap: 1rem;
                padding: 1rem 0;
            }
            
            .nav-menu {
                flex-wrap: wrap;
                justify-content: center;
                gap: 1rem;
            }
            
            .nav-menu a {
                font-size: 0.9rem;
            }
            
            .nav-icons {
                margin-top: 0.5rem;
            }
            
            .hero-title {
                font-size: 2.8rem;
            }
            
            .hero-buttons {
                flex-direction: column;
                gap: 1rem;
            }
            
            .hero-buttons .btn {
                text-align: center;
                width: 100%;
            }
            
            .category-grid,
            .product-grid,
            .footer-grid {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }
            
            .newsletter-form {
                flex-direction: column;
                padding: 0 1rem;
            }
            
            .newsletter-form input,
            .newsletter-form .btn {
                width: 100%;
            }
            
            .footer-bottom {
                flex-direction: column;
                text-align: center;
            }
            
            .footer-legal {
                justify-content: center;
            }
            
            #backToTop {
                bottom: 20px;
                right: 20px;
                width: 50px;
                height: 50px;
                font-size: 1.1rem;
            }
        }

        @media (max-width: 480px) {
            .hero-title {
                font-size: 2.2rem;
            }
            
            .hero-badge {
                font-size: 0.8rem;
                padding: 0.4rem 1rem;
            }
            
            .section-header h2 {
                font-size: 2rem;
            }
            
            .newsletter h2 {
                font-size: 2rem;
            }
            
            .product-name {
                font-size: 1.2rem;
            }
        }

        /* ===== LOADING ANIMATION ===== */
        .loading {
            display: inline-block;
            width: 40px;
            height: 40px;
            border: 3px solid rgba(44,95,45,0.1);
            border-radius: 50%;
            border-top-color: var(--primary-green);
            animation: spin 1s ease-in-out infinite;
        }

        /* ===== PAGE TRANSITION ===== */
        .fade-enter {
            opacity: 0;
        }

        .fade-enter-active {
            opacity: 1;
            transition: opacity 500ms ease-in;
        }

        .fade-exit {
            opacity: 1;
        }

        .fade-exit-active {
            opacity: 0;
            transition: opacity 500ms ease-in;
        }
        .story {
    background: linear-gradient(180deg, #ffffff 0%, var(--off-white) 100%);
    padding: 80px 0;
}

.story-grid {
    display: grid;
    grid-template-columns: 1.2fr 0.8fr;
    gap: 2rem;
    align-items: start;
    margin-top: 2rem;
}

.story-card {
    background: var(--white);
    border-radius: 18px;
    padding: 24px;
    box-shadow: var(--shadow);
    border: 1px solid rgba(0,0,0,0.06);
}

.story-card h3 {
    font-size: 1.35rem;
    margin-bottom: 10px;
    color: var(--primary-green-dark);
}

.story-card p {
    color: var(--text-light);
    margin-bottom: 12px;
    line-height: 1.7;
}

.story-quote {
    margin: 14px 0;
    padding: 14px 16px;
    border-left: 4px solid var(--primary-green);
    background: rgba(46, 125, 50, 0.06);
    border-radius: 12px;
    color: #2a3b2a;
}

.story-points {
    margin-top: 12px;
    display: grid;
    gap: 10px;
}

.story-point {
    display: flex;
    gap: 10px;
    align-items: flex-start;
}

.story-point i {
    color: var(--primary-green);
    margin-top: 3px;
}

.story-timeline {
    display: grid;
    gap: 12px;
}

.timeline-item {
    background: var(--white);
    border-radius: 16px;
    padding: 16px;
    border: 1px solid rgba(0,0,0,0.06);
    box-shadow: 0 8px 18px rgba(0,0,0,0.06);
}

.timeline-item span {
    display: inline-block;
    font-weight: 700;
    color: var(--primary-green);
    margin-bottom: 6px;
}

.timeline-item p {
    color: var(--text-light);
    margin: 0;
}

@media (max-width: 900px) {
    .story-grid {
        grid-template-columns: 1fr;
    }
}
/* ===== REGIONS SECTION ===== */
.regions {
  padding: 80px 0;
  background: #f7f7f3;
}

.region-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 18px;
  margin-top: 36px;
}

.region-card {
  background: #fff;
  border: 1px solid rgba(0,0,0,0.06);
  border-radius: 18px;
  padding: 22px;
  box-shadow: 0 10px 22px rgba(0,0,0,0.06);
  text-align: center;
  transition: transform .2s ease, box-shadow .2s ease;
}

.region-card:hover {
  transform: translateY(-3px);
  box-shadow: 0 14px 28px rgba(0,0,0,0.09);
}

.region-icon {
  width: 74px;
  height: 74px;
  border-radius: 50%;
  background: rgba(46,125,50,0.08);
  display: grid;
  place-items: center;
  margin: 0 auto 14px;
  font-size: 28px;
}

.region-title {
  margin: 0;
  font-size: 20px;
  line-height: 1.2;
  color: #2c5f2d;
}

.region-desc {
  margin: 10px 0 0;
  color: #666;
  line-height: 1.55;
  min-height: 70px; /* giữ đều chiều cao chữ */
}

.region-link {
  display: inline-flex;
  gap: 8px;
  align-items: center;
  margin-top: 14px;
  color: #2c5f2d;
  font-weight: 700;
  text-decoration: none;
}

@media (max-width: 1100px) {
  .region-grid { grid-template-columns: repeat(2, 1fr); }
}
@media (max-width: 560px) {
  .region-grid { grid-template-columns: 1fr; }
}

    </style>
</head>
<body>
    <!-- HEADER -->
    <header class="header">
        <nav class="navbar">
            <div class="nav-brand">
                <a href="#home">
                    <h1><i class="fas fa-leaf"></i> Nông Sản Việt</h1>
                </a>
            </div>
            <ul class="nav-menu">
                <li><a href="#home" class="active">TRANG CHỦ</a></li>
                 <li><a href="<%=request.getContextPath()%>/products">SẢN PHẨM</a></li>
                <li><a href="#regions">VÙNG MIỀN</a></li>
                <li><a href="#story">CÂU CHUYỆN</a></li>
                <li><a href="#contact">LIÊN HỆ</a></li>
            </ul>
            <div class="nav-icons">
    <a href="#" data-count="3"><i class="fas fa-search"></i></a>
    <a href="#" data-count="2"><i class="fas fa-shopping-cart"></i></a>

    <!-- FIX: click icon user -> /login -->
    <a href="<%=request.getContextPath()%>/login" data-count="1">
        <i class="fas fa-user"></i>
    </a>
</div>
        </nav>
    </header>

    <!-- HERO SECTION -->
    <section class="hero" id="home">
        <div class="hero-content">
            <span class="hero-badge">100% TỰ NHIÊN & SẠCH</span>
            <h1 class="hero-title">
                <span>Tinh</span> <span>Hoa</span> <br>
                <span>Đất</span> <span>Việt</span>
            </h1>
            <p class="hero-description">
                Mang hương vị thuần khiết từ những cánh đồng trù phú của Việt Nam 
                đến tận bàn ăn gia đình bạn. Chúng tôi cam kết chất lượng và sự bền vững.
            </p>
            <div class="hero-buttons">
                <a href="#products" class="btn btn-primary">KHÁM PHÁ NGAY</a>
                <a href="#story" class="btn btn-secondary">TÌM HIỂU THÊM</a>
            </div>
        </div>
    </section>

    <!-- CATEGORIES SECTION -->
    <section class="categories" id="categories">
        <div class="container">
            <div class="section-header">
                <span class="section-badge">DANH MỤC</span>
                <h2>Sản phẩm của chúng tôi</h2>
                <p>Khám phá những sản phẩm chất lượng nhất từ khắp mọi miền đất nước</p>
            </div>
            
            <div class="category-grid">
                <div class="category-item">
                    <div class="category-icon">
                        <i class="fas fa-apple-alt"></i>
                    </div>
                    <h3>Trái Cây</h3>
                    <p>Trái cây tươi ngon từ khắp mọi miền, được thu hoạch đúng vụ</p>
                </div>
                
                <div class="category-item">
                    <div class="category-icon">
                        <i class="fas fa-carrot"></i>
                    </div>
                    <h3>Rau Củ</h3>
                    <p>Rau củ sạch theo mùa, đảm bảo an toàn vệ sinh thực phẩm</p>
                </div>
                
                <div class="category-item">
                    <div class="category-icon">
                        <i class="fas fa-seedling"></i>
                    </div>
                    <h3>Lương Thực</h3>
                    <p>Gạo và ngũ cốc chất lượng cao, đặc sản từ các vùng miền</p>
                </div>
                
                <div class="category-item">
                    <div class="category-icon">
                        <i class="fas fa-mug-hot"></i>
                    </div>
                    <h3>Đồ Uống</h3>
                    <p>Trà, cà phê đặc sản vùng miền, hương vị đậm đà khó quên</p>
                </div>
            </div>
        </div>
    </section>
    <!-- REGIONS SECTION -->
<section class="regions" id="regions">
  <div class="container">
    <div class="section-header">
      <span class="section-badge">VÙNG MIỀN</span>
      <h2>4 vùng miền đặc trưng Việt Nam</h2>
      <p>Khám phá đặc sản và câu chuyện nông sản đến từ những vùng đất giàu bản sắc.</p>
    </div>

    <div class="region-grid">
  <div class="region-card">
    <div class="region-icon">🏔️</div>
    <h3 class="region-title">Miền Bắc</h3>
    <p class="region-desc">Khí hậu bốn mùa rõ rệt, nông sản mang tính mùa vụ cao.</p>
    <a class="region-link" href="<%=request.getContextPath()%>/products?region=mien-bac">Xem chi tiết →</a>
  </div>

  <div class="region-card">
    <div class="region-icon">🏖️</div>
    <h3 class="region-title">Miền Trung (Tây Nguyên)</h3>
    <p class="region-desc">Nắng gió khắc nghiệt tạo nên vị ngọt đậm và sức sống mạnh mẽ.</p>
    <a class="region-link" href="<%=request.getContextPath()%>/products?region=mien-trung">Xem chi tiết →</a>
  </div>

  <div class="region-card">
    <div class="region-icon">🌿</div>
    <h3 class="region-title">Miền Nam (Đông Nam Bộ)</h3>
    <p class="region-desc">Đất đỏ bazan màu mỡ, trái cây giá trị cao, sản lượng lớn.</p>
    <a class="region-link" href="<%=request.getContextPath()%>/products?region=mien-nam">Xem chi tiết →</a>
  </div>

  <div class="region-card">
    <div class="region-icon">🚤</div>
    <h3 class="region-title">Miền Tây (ĐBSCL)</h3>
    <p class="region-desc">Vựa trái cây lớn nhất cả nước, phù sa Mekong bồi đắp.</p>
    <a class="region-link" href="<%=request.getContextPath()%>/products?region=mien-tay">Xem chi tiết →</a>
  </div>
</div>
  </div>
</section>
    <!-- FEATURED PRODUCTS -->
    <section class="featured-products" id="products">
        <div class="container">
            <div class="section-header">
                <span class="section-badge">BẢN CHẠY NHẤT</span>
                <h2>Sản phẩm nổi bật</h2>
                <p>Những sản phẩm được yêu thích nhất từ khắp mọi miền đất nước</p>
            </div>

            <div class="product-grid">
  <%
    List<Product> featuredProducts = (List<Product>) request.getAttribute("featuredProducts");
    if (featuredProducts != null) {
      for (Product p : featuredProducts) {
  %>
    <div class="product-card">
      <% if (p.isNew()) { %><span class="product-tag">MỚI VỀ</span><% } %>
      <div class="product-image">
        <img src="<%=p.getImageUrl()%>" alt="<%=p.getName()%>">
      </div>
      <div class="product-info">
        <span class="product-category"><%=p.getCategory()%></span>
        <h3 class="product-name"><%=p.getName()%></h3>
        <p class="product-description">
          Thu hoạch: <b><%=p.getFormattedHarvestDate()%></b> • Tồn kho: <b><%=p.getFormattedQuantityKg()%></b>
        </p>
        <div class="product-price">
          <span class="price"><%=p.getFormattedPricePerKg()%></span>
        </div>
        <a href="<%=request.getContextPath()%>/login" class="product-link">
          Mua ngay <i class="fas fa-arrow-right"></i>
        </a>
      </div>
    </div>
  <%
      }
    }
  %>
</div>
    <!-- STORY SECTION -->
<section class="story" id="story">
    <div class="container">
        <div class="section-header">
            <span class="section-badge">CÂU CHUYỆN</span>
            <h2>Câu chuyện “Nông Sản Việt”</h2>
            <p>Hành trình từ những chuyến đi thực tế đến một nền tảng giúp bà con bán hàng và quản lý tài chính dễ dàng.</p>
        </div>

        <div class="story-grid">
            <!-- Nội dung chính -->
            <div class="story-card">
                <h3>Từ trăn trở đến hành động</h3>

                <p>
                    Những chuyến đi thực tế về các miền quê đã gieo vào lòng nhóm chúng tôi một nỗi trăn trở:
                    Nông sản Việt Nam rất đa dạng và chất lượng, nhưng bà con nông dân vẫn luôn chật vật với khâu tìm đầu ra
                    và loay hoay ghi chép sổ sách thu chi mỗi mùa vụ.
                </p>

                <p>
                    Đó là lúc dự án web-app <b>“Nông Sản Việt”</b> chính thức được chúng tôi ấp ủ và bắt tay vào xây dựng.
                </p>

                <p>
                    Sau nhiều tháng ròng rã thức đêm lập trình và lặn lội đến từng nhà vườn để tìm hiểu nhu cầu thực tế,
                    nền tảng cũng được hoàn thiện. “Nông Sản Việt” được thiết kế với hai sứ mệnh chính:
                    một mặt tạo ra không gian giao thương giúp quảng bá và bán trực tiếp các đặc sản vùng miền đến tay người tiêu dùng cả nước;
                    mặt khác, tích hợp hệ thống quản lý tài chính tối giản dành riêng cho người bán.
                </p>

                <div class="story-quote">
                    <b>Khoảnh khắc đáng nhớ:</b> Ngày chạy thử nghiệm, chú Ba ở Tiền Giang là người đầu tiên đưa vườn bưởi da xanh của mình lên app.
                    Chỉ sau một tuần, đơn hàng từ các thành phố lớn đổ về tấp nập.
                </div>

                <p>
                    Thay vì phải cặm cụi cộng trừ trên những cuốn sổ tay nhàu nhĩ dễ nhầm lẫn như trước,
                    giờ đây chú Ba chỉ cần mở điện thoại là có thể theo dõi chính xác doanh thu, các khoản phí
                    và dòng tiền thực tế chảy vào ví mỗi ngày.
                </p>

                <p>
                    Nhìn nụ cười rạng rỡ của chú Ba và nhiều bà con khác khi không chỉ bán được hàng giá tốt
                    mà còn tự tin làm chủ được túi tiền của mình, cả nhóm nhìn nhau đầy tự hào.
                    Chúng tôi hiểu rằng “Nông Sản Việt” không chỉ là một sản phẩm công nghệ,
                    mà là cầu nối mang lại giá trị thực và cuộc sống ổn định hơn cho nền nông nghiệp nước nhà.
                </p>

                <div class="story-points">
                    <div class="story-point">
                        <i class="fas fa-check-circle"></i>
                        <div>
                            <b>Sứ mệnh 1:</b>
                            <div style="color: var(--text-light);">Kết nối – quảng bá – bán trực tiếp đặc sản vùng miền đến người tiêu dùng.</div>
                        </div>
                    </div>

                    <div class="story-point">
                        <i class="fas fa-check-circle"></i>
                        <div>
                            <b>Sứ mệnh 2:</b>
                            <div style="color: var(--text-light);">Quản lý tài chính tối giản cho người bán: doanh thu – chi phí – dòng tiền rõ ràng.</div>
                        </div>
                    </div>
                </div>

                <div style="margin-top:16px;">
                    <a href="#products" class="btn btn-primary">Khám phá sản phẩm</a>
                    <a href="#contact" class="btn btn-secondary">Liên hệ</a>
                </div>
            </div>

            <!-- Timeline -->
            <div class="story-timeline">
                <div class="timeline-item">
                    <span>Khởi nguồn</span>
                    <p>Những chuyến đi thực tế về miền quê, chứng kiến khó khăn đầu ra và sổ sách thu chi.</p>
                </div>
                <div class="timeline-item">
                    <span>Xây dựng</span>
                    <p>Thức đêm lập trình và đến từng nhà vườn tìm hiểu nhu cầu để hoàn thiện nền tảng.</p>
                </div>
                <div class="timeline-item">
                    <span>Thử nghiệm</span>
                    <p>Chú Ba (Tiền Giang) đưa bưởi da xanh lên app, đơn hàng tăng nhanh chỉ sau 1 tuần.</p>
                </div>
                <div class="timeline-item">
                    <span>Giá trị</span>
                    <p>Không chỉ bán được giá tốt, bà con còn theo dõi doanh thu – chi phí – dòng tiền ngay trên điện thoại.</p>
                </div>
            </div>
        </div>
    </div>
</section>
    <!-- NEWSLETTER SECTION -->
    <section class="newsletter" id="newsletter">
        <div class="container">
            <div class="newsletter-content">
                <h2>Nhận tin tức & Ưu đãi</h2>
                <p>Đăng ký ngay để nhận thông tin về mùa vụ mới và chương trình khuyến mãi hấp dẫn</p>
                <form class="newsletter-form" action="#" method="post">
                    <input type="email" placeholder="Nhập email của bạn" required>
                    <button type="submit" class="btn btn-primary">ĐĂNG KÝ NGAY</button>
                </form>
            </div>
        </div>
    </section>

    <!-- FOOTER -->
    <footer class="footer" id="contact">
        <div class="container">
            <div class="footer-grid">
                <div class="footer-about">
                    <h4><i class="fas fa-leaf"></i> Nông Sản Việt</h4>
                    <p>Chúng tôi tự hào là cầu nối đưa những sản phẩm nông nghiệp tinh túy nhất 
                       của Việt Nam đến với mọi gia đình, đảm bảo tiêu chuẩn sạch và an toàn.</p>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-youtube"></i></a>
                        <a href="#"><i class="fab fa-tiktok"></i></a>
                    </div>
                </div>

                <div class="footer-links">
                    <h5>Liên kết nhanh</h5>
                    <ul>
                        <li><a href="#">Về chúng tôi</a></li>
                        <li><a href="#">Sản phẩm nổi bật</a></li>
                        <li><a href="#">Chính sách giao hàng</a></li>
                        <li><a href="#">Blog nông nghiệp</a></li>
                    </ul>
                </div>

                <div class="footer-support">
                    <h5>Hỗ trợ khách hàng</h5>
                    <ul>
                        <li><a href="#">Câu hỏi thường gặp</a></li>
                        <li><a href="#">Hướng dẫn mua hàng</a></li>
                        <li><a href="#">Chính sách đổi trả</a></li>
                        <li><a href="#">Liên hệ hỗ trợ</a></li>
                    </ul>
                </div>

                <div class="footer-contact">
                    <h5>Liên hệ</h5>
                    <address>
                        <p><i class="fas fa-map-marker-alt"></i> 123 Đường Lê Lợi, Quận 1, TP.HCM</p>
                        <p><i class="fas fa-phone"></i> +84 123 456 789</p>
                        <p><i class="fas fa-envelope"></i> info@nongsanviet.com</p>
                    </address>
                </div>
            </div>

            <div class="footer-bottom">
                <p>© 2024 NÔNG SẢN VIỆT. All Rights Reserved.</p>
                <div class="footer-legal">
                    <a href="#">ĐIỀU KHOẢN</a>
                    <a href="#">BẢO MẬT</a>
                </div>
            </div>
        </div>
    </footer>

    <!-- BACK TO TOP BUTTON -->
    <button onclick="topFunction()" id="backToTop" title="Lên đầu trang">
        <i class="fas fa-arrow-up"></i>
    </button>

    <!-- JAVASCRIPT -->
    <script>
        // Back to top button
        window.onscroll = function() {
            scrollFunction();
        };

        function scrollFunction() {
            const backToTop = document.getElementById("backToTop");
            if (document.body.scrollTop > 300 || document.documentElement.scrollTop > 300) {
                backToTop.classList.add("show");
            } else {
                backToTop.classList.remove("show");
            }
        }

        function topFunction() {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        }

        // Active menu on scroll
        const sections = document.querySelectorAll('section');
        const navLinks = document.querySelectorAll('.nav-menu a');

        window.addEventListener('scroll', () => {
            let current = '';
            
            sections.forEach(section => {
                const sectionTop = section.offsetTop;
                const sectionHeight = section.clientHeight;
                if (pageYOffset >= sectionTop - 200) {
                    current = section.getAttribute('id');
                }
            });

            navLinks.forEach(link => {
                link.classList.remove('active');
                if (link.getAttribute('href') === `#${current}`) {
                    link.classList.add('active');
                }
            });
        });

        // Smooth scroll for anchor links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });

        // Newsletter form
        document.querySelector('.newsletter-form')?.addEventListener('submit', function(e) {
            e.preventDefault();
            const email = this.querySelector('input[type="email"]').value;
            if (email) {
                alert('Cảm ơn ' + email + ' đã đăng ký! Chúng tôi sẽ gửi thông tin sớm nhất.');
                this.reset();
            }
        });

        // Add to cart
        document.querySelectorAll('.product-overlay a:last-child, .product-link').forEach(btn => {
            btn.addEventListener('click', function(e) {
                e.preventDefault();
                const productCard = this.closest('.product-card');
                const productName = productCard ? productCard.querySelector('.product-name').textContent : 'sản phẩm';
                alert('Đã thêm "' + productName + '" vào giỏ hàng!');
            });
        });

        // View product
        document.querySelectorAll('.product-overlay a:first-child').forEach(btn => {
            btn.addEventListener('click', function(e) {
                e.preventDefault();
                const productCard = this.closest('.product-card');
                const productName = productCard ? productCard.querySelector('.product-name').textContent : 'sản phẩm';
                alert('Xem chi tiết: ' + productName);
            });
        });

        console.log('%c🌱 Nông Sản Việt - Tinh hoa đất Việt', 'color: #2c5f2d; font-size: 16px; font-weight: bold;');
        console.log('Chào mừng bạn đến với website Nông Sản Việt!');
    </script>
</body>
</html>