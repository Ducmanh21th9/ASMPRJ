// Back to Top Button
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

// Active Navigation
const sections = document.querySelectorAll('section');
const navLinks = document.querySelectorAll('.nav-menu a');

window.addEventListener('scroll', function() {
    let current = '';
    
    sections.forEach(function(section) {
        const sectionTop = section.offsetTop;
        const sectionHeight = section.clientHeight;
        if (window.pageYOffset >= sectionTop - 200) {
            current = section.getAttribute('id');
        }
    });

    navLinks.forEach(function(link) {
        link.classList.remove('active');
        if (link.getAttribute('href') === '#' + current) {
            link.classList.add('active');
        }
    });
});

// Smooth Scroll
document.querySelectorAll('a[href^="#"]').forEach(function(anchor) {
    anchor.addEventListener('click', function(e) {
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

// Product Hover Effect
const productCards = document.querySelectorAll('.product-card');

productCards.forEach(function(card) {
    const overlay = card.querySelector('.product-overlay');
    if (overlay) {
        card.addEventListener('mouseenter', function() {
            overlay.style.opacity = '1';
        });
        
        card.addEventListener('mouseleave', function() {
            overlay.style.opacity = '0';
        });
    }
});

// Newsletter Form
const newsletterForm = document.querySelector('.newsletter-form');
if (newsletterForm) {
    newsletterForm.addEventListener('submit', function(e) {
        e.preventDefault();
        const email = this.querySelector('input[type="email"]').value;
        
        if (email) {
            alert('Cảm ơn bạn đã đăng ký! Chúng tôi sẽ gửi thông tin sớm nhất.');
            this.reset();
        }
    });
}

// Add to Cart
document.querySelectorAll('.btn-cart').forEach(function(btn) {
    btn.addEventListener('click', function(e) {
        e.preventDefault();
        const productCard = this.closest('.product-card');
        const productName = productCard ? productCard.querySelector('.product-name').textContent : 'sản phẩm';
        alert('Đã thêm "' + productName + '" vào giỏ hàng!');
    });
});

// View Product
document.querySelectorAll('.btn-view').forEach(function(btn) {
    btn.addEventListener('click', function(e) {
        e.preventDefault();
        const productCard = this.closest('.product-card');
        const productName = productCard ? productCard.querySelector('.product-name').textContent : 'sản phẩm';
        alert('Xem chi tiết: ' + productName);
    });
});

// Animation on Scroll
const animateElements = document.querySelectorAll('[data-animate]');

function checkAnimation() {
    animateElements.forEach(function(element) {
        const elementTop = element.getBoundingClientRect().top;
        const windowHeight = window.innerHeight;
        
        if (elementTop < windowHeight - 100) {
            const animation = element.getAttribute('data-animate');
            const delay = element.getAttribute('data-delay') || '0s';
            element.style.animationDelay = delay;
            element.classList.add('animate__animated', 'animate__' + animation);
        }
    });
}

window.addEventListener('scroll', checkAnimation);
window.addEventListener('load', checkAnimation);

// Mobile Menu Toggle
function toggleMobileMenu() {
    const navMenu = document.querySelector('.nav-menu');
    const navIcons = document.querySelector('.nav-icons');
    const navbar = document.querySelector('.navbar');
    
    if (window.innerWidth <= 768) {
        if (!document.querySelector('.menu-toggle')) {
            const menuToggle = document.createElement('button');
            menuToggle.className = 'menu-toggle';
            menuToggle.innerHTML = '<i class="fas fa-bars"></i>';
            navbar.insertBefore(menuToggle, navMenu);
            
            menuToggle.addEventListener('click', function() {
                navMenu.classList.toggle('show');
                if (navIcons) navIcons.classList.toggle('show');
                this.innerHTML = navMenu.classList.contains('show') ? 
                    '<i class="fas fa-times"></i>' : '<i class="fas fa-bars"></i>';
            });
        }
    }
}

window.addEventListener('resize', toggleMobileMenu);
window.addEventListener('load', toggleMobileMenu);

// Console greeting
console.log('%c🌱 Nông Sản Việt - Tinh hoa đất Việt', 
            'color: #2c5f2d; font-size: 16px; font-weight: bold;');
console.log('Chào mừng bạn đến với website Nông Sản Việt!');