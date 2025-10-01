<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>P&T Shop</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- link font chữ -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap">
    <!-- link icon -->
    <link rel="stylesheet" href="https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css">
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-straight/css/uicons-regular-straight.css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!-- link css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
    <link href="css/productdetail.css" rel="stylesheet" type="text/css"/>
    <link href="css/reponsive1.css" rel="stylesheet" type="text/css"/>
    <link rel="icon" href="./img/logo/main.png" type="image/x-icon"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous"></script>
</head>
<style>
  form.example input[type=text] {
    padding: 10px;
    font-size: 17px;
    border: 1px solid grey;
    float: left;
    width: 80%;
    background: #f1f1f1;
  }
  
  form.example button {
    float: left;
    width: 20%;
    padding: 10px;
    background: #2196F3;
    color: white;
    font-size: 17px;
    border: 1px solid grey;
    border-left: none;
    cursor: pointer;
  }
  
  form.example button:hover {
    background: #0b7dda;
  }
  
  form.example::after {
    content: "";
    clear: both;
    display: table;
  }
  .sale-off-2 {
  top: 14px;
  right: 14px;
  }
        /* Mobile & tablet  */
@media (max-width: 1023px) {
  .sale-off-2 {
  top: 1px;
}
}
/* tablet */
@media (min-width: 740px) and (max-width: 1023px) {
  .daonguoc {
    display: flex;
    flex-direction: column-reverse;
  }
  #main-img {
    max-width: unset;
  }
  #main-img img {
    width: 100%;
    margin-left: 0;
    margin-top: 0;
    background-size: cover;
    background-position: center;
    margin-bottom: 10px;
  }
  .all-img > li {
    display: inline-block;
  }
  .all-img {
    padding: unset;
  }
  .img-item img {
    width: 150px;
    cursor: pointer;
    margin: 5px 10px;
  }
  textarea {
    width: 100%;
  }
  .btn-comment {
    display: block;
    width: 100%;
    padding: 25px 0 35px 0;
    font-size: small;
  }
}
/* mobile */
@media (max-width: 739px) {
  .daonguoc {
    display: flex;
    flex-direction: column-reverse;
  }
  #main-img img {
    width: 100%;
    margin-left: 0;
    margin-top: 0;
    background-size: cover;
    background-position: center;
    margin-bottom: 10px;
  }
  .all-img > li {
    display: inline-block;
  }
  .all-img {
    padding: unset;
  }
  .img-item img {
    width: 80px;
    margin: 5px 2px;
  }
  .product__price {
    margin: 15px 0;
  }
  .product__wrap {
    display: block;
    margin: 15px 0;
  }
  .add-cart {
    width: 100%;
    padding: 10px 0;
    margin: 15px 0;
  }
  .product__shopnow {
    display: block;
  }
  .shopnow {
    width: 100%;
    margin-bottom: 15px;
  }
  .likenow {
    width: 100%;
  }
  .btn-comment {
    width: 100%;
  }
  .sale-off-2 {
    top: 1px;
  }
} 

/* Floating Reel Popup Styles */
.reel-popup {
    position: fixed;
    bottom: 150px;
    right: 20px;
    width: 150px; /* Small preview size */
    height: 280px; /* Aspect ratio for a reel */
    border-radius: 10px;
    overflow: hidden;
    cursor: grab; /* Change cursor to indicate it's movable */
    box-shadow: 0 5px 15px rgba(0,0,0,0.3);
    z-index: 998;
    transition: transform 0.3s ease;
}

.reel-popup:hover {
    transform: scale(1.05);
}

.reel-popup-video {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.reel-popup-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.4);
    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
    font-size: 12px;
    text-align: center;
}

.reel-popup-overlay i {
    display: block;
    font-size: 16px;
    margin-bottom: 5px;
}

/* Reel Modal Styles */
.reel-modal-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.85);
    z-index: 1050; /* Higher than other content */
    display: flex;
    justify-content: center;
    align-items: center;
}

.reel-modal-content {
    position: relative;
    width: 350px; /* Typical mobile reel width */
    height: 70vh; /* Adjust height as needed */
    max-height: 800px;
    background-color: #000;
    border-radius: 15px;
    overflow: hidden;
    box-shadow: 0 5px 15px rgba(0,0,0,0.5);
}

.reel-video-container {
    width: 100%;
    height: 100%;
}

#reel-video-player {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.reel-close-btn {
    position: absolute;
    top: 10px;
    left: 10px;
    background: rgba(0, 0, 0, 0.5);
    color: white;
    border: none;
    border-radius: 50%;
    width: 30px;
    height: 30px;
    font-size: 20px;
    cursor: pointer;
    z-index: 1051;
}

.reel-nav-btn {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background: rgba(0, 0, 0, 0.3);
    color: white;
    border: none;
    padding: 10px;
    cursor: pointer;
    font-size: 24px;
    z-index: 1051;
    border-radius: 50%;
    width: 40px;
    height: 40px;
    display: flex;
    justify-content: center;
    align-items: center;
}

.reel-nav-btn.prev {
    left: 10px;
}

.reel-nav-btn.next {
    right: 10px;
}
.hidden {
    display: none !important;
}
  </style>
<body>
  <div class="overlay hidden"></div>
  <!-- mobile menu -->
  <div class="mobile-main-menu">
    <div class="drawer-header">
      <a href="">
        <div class="drawer-header--auth">
          <div class="_object">
            <img src="./img/product/giayxah2.jpg" alt="">
          </div>
          <div class="_body">Đăng nhập
            <br>Nhận nhiều ưu đãi hơn
          </div>
        </div>
      </a>
    </div>
    <ul class="ul-first-menu">
      <li>
        <a href="">Đăng nhập</a>
      </li>
      <li>
        <a href="" class="abc">Đăng kí</a>
      </li>
    </ul>
    <!-- <ul class="ul-first-menu">
      <li>
        <a href="">Tài khoản của tôi</a>
      </li>
      <li>
        <a href="">Địạ chỉ của tôi</a>
      </li>
      <li>
        <a href="">Đơn mua</a>
      </li>
      <li>
        <a href="" class="list-like-noicte">Danh sách yêu thích</a>
        <span id="header__second__like--notice" class="header__second__like--notice">3</span>
      </li>
      <li>
        <a href="">Đăng xuất</a>
      </li> -->
    </ul>
    <div class="la-scroll-fix-infor-user">
      <div class="la-nav-menu-items">
        <div class="la-title-nav-items">
          <strong>Danh mục</strong>
        </div>
        <ul class="la-nav-list-items">
          <li class="ng-scope">
            <a href="./index.jsp">Trang chủ</a>
          </li>
          <li class="ng-scope">
            <a href="./intro.jsp">Giới thiệu</a>
          </li>
          <li class="ng-scope ng-has-child1">
            <a href="./product.jsp">Sản phẩm <i class="fas fa-plus cong"></i> <i class="fas fa-minus tru hidden"></i></a>
            <ul class="ul-has-child1">
              <li class="ng-scope ng-has-child2">
                <a href="./product.jsp">Tất cả sản phẩm <i class="fas fa-plus cong1" onclick="hienthi(1,`abc`)"></i> <i
                    class="fas fa-minus tru1 hidden" onclick="hienthi(1,`abc`)"></i></a>
                <ul class="ul-has-child2 hidden" id="abc">
                  <li class="ng-scope">
                    <a href="./product.jsp">Bóng đá</a>
                  </li>
                  <li class="ng-scope">
                    <a href="./product.jsp">Chạy</a>
                  </li>
                  <li class="ng-scope">
                    <a href="./product.jsp">Cầu lông</a>
                  </li>
                  <li class="ng-scope">
                    <a href="./product.jsp">Bóng rổ</a>
                  </li>
                  <li class="ng-scope">
                    <a href="./product.jsp">Quần vợt</a>
                  </li>
                  <li class="ng-scope">
                    <a href="./product.jsp">Bơi lội</a>
                  </li>
                  <li class="ng-scope">
                    <a href="./product.jsp">GOLF</a>
                  </li>
                </ul>
              </li>
              <li class="ng-scope ng-has-child2">
                <a href="./product.jsp">Quần áo <i class="fas fa-plus cong2" onclick="hienthi(2,`abc2`)"></i> <i
                    class="fas fa-minus tru2 hidden" onclick="hienthi(2,`abc2`)"></i></a>
                <ul class="ul-has-child2 hidden" id="abc2">
                  <li class="ng-scope">
                    <a href="./product.jsp">Bóng đá</a>
                  </li>
                  <li class="ng-scope">
                    <a href="./product.jsp">Chạy</a>
                  </li>
                  <li class="ng-scope">
                    <a href="./product.jsp">Cầu lông</a>
                  </li>
                  <li class="ng-scope">
                    <a href="./product.jsp">Bóng rổ</a>
                  </li>
                  <li class="ng-scope">
                    <a href="./product.jsp">Quần vợt</a>
                  </li>
                  <li class="ng-scope">
                    <a href="./product.jsp">Bơi lội</a>
                  </li>
                  <li class="ng-scope">
                    <a href="./product.jsp">GOLF</a>
                  </li>
                </ul>
              </li>
              <li class="ng-scope ng-has-child2">
                <a href="./product.jsp">Già dép<i class="fas fa-plus cong3" onclick="hienthi(3,`abc3`)"></i> <i
                    class="fas fa-minus tru3 hidden" onclick="hienthi(3,`abc3`)"></i></a>
                <ul class="ul-has-child2 hidden" id="abc3">
                  <li class="ng-scope">
                    <a href="./product.jsp">Bóng đá</a>
                  </li>
                  <li class="ng-scope">
                    <a href="./product.jsp">Chạy</a>
                  </li>
                  <li class="ng-scope">
                    <a href="./product.jsp">Cầu lông</a>
                  </li>
                  <li class="ng-scope">
                    <a href="./product.jsp">Bóng rổ</a>
                  </li>
                  <li class="ng-scope">
                    <a href="./product.jsp">Quần vợt</a>
                  </li>
                  <li class="ng-scope">
                    <a href="./product.jsp">Bơi lội</a>
                  </li>
                  <li class="ng-scope">
                    <a href="./product.jsp">GOLF</a>
                  </li>
                </ul>
              </li>
              <li class="ng-scope ng-has-child2">
                <a href="./product.jsp">Phụ kiện <i class="fas fa-plus cong4" onclick="hienthi(4,`abc4`)"></i> <i
                    class="fas fa-minus tru4 hidden " onclick="hienthi(4,`abc4`)"></i></a>
                <ul class="ul-has-child2 hidden" id="abc4">
                  <li class="ng-scope">
                    <a href="./product.jsp">Bóng đá</a>
                  </li>
                  <li class="ng-scope">
                    <a href="./product.jsp">Chạy</a>
                  </li>
                  <li class="ng-scope">
                    <a href="./product.jsp">Cầu lông</a>
                  </li>
                  <li class="ng-scope">
                    <a href="./product.jsp">Bóng rổ</a>
                  </li>
                  <li class="ng-scope">
                    <a href="./product.jsp">Quần vợt</a>
                  </li>
                  <li class="ng-scope">
                    <a href="./product.jsp">Bơi lội</a>
                  </li>
                  <li class="ng-scope">
                    <a href="./product.jsp">GOLF</a>
                  </li>
                </ul>
              </li>
            </ul>
          </li>
          <li class="ng-scope">
            <a href="./news.jsp">Tin tức</a>
          </li>
          <li class="ng-scope">
            <a href="./contact.jsp">Liên hệ</a>
          </li>
        </ul>
      </div>
    </div>
    <ul class="mobile-support">
      <li>
        <div class="drawer-text-support">Hỗ trợ</div>
      </li>
      <li>
        <i class="fas fa-phone-square-alt footer__item-icon">HOTLINE: </i>
        <a href="tel:19006750">19006750</a>
      </li>
      <li>
        <i class="fas fa-envelope-square footer__item-icon">Email: </i>
        <a href="mailto:support@sapo.vn">support@gmail.vn</a>
      </li>
    </ul>
  </div>
  <!-- end mobile menu -->
  <!-- header -->
  <header class="header">
    <div class="container">
      <div class="top-link clearfix hidden-sm hidden-xs">
        <div class="row">
          <div class="col-6 social_link">
            <div class="social-title"></div>
            <a href=""><i class="" style="font-size: 24px; margin-right: 10px"></i></a>
            <a href=""><i class="" style="font-size: 24px; margin-right: 10px;color: pink;"></i></a>
            <a href=""><i class="" style="font-size: 24px; margin-right: 10px;color: red;"></i></a>
            <a href=""><i class="" style="font-size: 24px; margin-right: 10px"></i></a>
          </div>
          <div class="col-6 login_link">
            <ul class="header_link right m-auto">
              <li>
                <a href="./login.jsp"><i class="fas fa-sign-in-alt mr-3"></i>Đăng nhập</a>
              </li>
              <li>
                <a href="./register.jsp"><i class="fas fa-user-plus mr-3" style="margin-left: 10px;"></i>Đăng kí</a>
              </li>
            </ul>
            <!-- <ul class="nav nav__first right">
                <li class="nav-item nav-item__first nav-item__first-user">
                  <img src="./img/product/noavatar.png" alt="" class="nav-item__first-img">
                  <span class="nav-item__first-name">Quốc Trung</span>
                  <ul class="nav-item__first-menu">
                    <li class="nav-item__first-item">
                      <a href="">Tài khoản của tôi</a>
                    </li>
                    <li class="nav-item__first-item">
                      <a href="">Địa chỉ của tôi</a>
                    </li>
                    <li class="nav-item__first-item">
                      <a href="">Đơn mua</a>
                    </li>
                    <li class="nav-item__first-item">
                      <a href="">Đăng xuất</a>
                    </li>
                  </ul>
                </li>
              </ul> -->
          </div>
        </div>
      </div>
      <div class="header-main clearfix">
        <div class="row">
          <div class="col-lg-3 col-100-h">
            <div id="trigger-mobile" class="visible-sm visible-xs"><i class="fas fa-bars"></i></div>
            <div class="logo">
              <a href="">
                <img src="./img/logo/logomain.png" alt="">
              </a>
            </div>
            <div class="mobile_cart visible-sm visible-xs">
              <a href="./cart.jsp" class="header__second__cart--icon">
                <i class="fas fa-shopping-cart"></i>
                <span id="header__second__cart--notice" class="header__second__cart--notice">3</span>
              </a>
              <a href="./listlike.jsp" class="header__second__like--icon">
                <i class="far fa-heart"></i>
                <span id="header__second__like--notice" class="header__second__like--notice">3</span>
              </a>
            </div>
          </div>
          <div class="col-lg-6 m-auto pdt15">
            <form class="example" action="./product.jsp">
              <input type="text" class="input-search" placeholder="Tìm kiếm.." name="search">
              <button type="submit" class="search-btn"><i class="fa fa-search"></i></button>
            </form>
          </div>
          <div class="col-3 m-auto hidden-sm hidden-xs">
            <div class="item-car clearfix">
              <a href="./cart.jsp" class="header__second__cart--icon">
                <i class="fas fa-shopping-cart"></i>
                <span id="header__second__cart--notice" class="header__second__cart--notice">3</span>
              </a>
            </div>
            <div class="item-like clearfix">
              <a href="./listlike.jsp" class="header__second__like--icon">
                <i class="far fa-heart"></i>
                <span id="header__second__like--notice" class="header__second__like--notice">3</span>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <nav class="header_nav hidden-sm hidden-xs">
      <div class="container">
        <ul class="header_nav-list nav">
          <li class="header_nav-list-item "><a href="./index.jsp" class="active">Trang chủ</a></li>
          <li class="header_nav-list-item"><a href="./intro.jsp">Giới thiệu</a></li>
          <li class="header_nav-list-item has-mega">
            <a href="./product.jsp">Sản phẩm<i class="fas fa-angle-right" style="margin-left: 5px;"></i></a>
            <div class="mega-content" style="overflow-x: hidden;">
              <div class="row">
                <ul class="col-8 no-padding level0">
                  <li class="level1">
                    <a class="hmega" href="./product.jsp">Tất cả sản phẩm</a>
                    <!-- <ul class="level1">
                        <li class="level2"><a href="">Bóng đá</a></li>
                        <li class="level2"><a href="">Bóng đá</a></li>
                        <li class="level2"><a href="">Bóng đá</a></li>
                        <li class="level2"><a href="">Bóng đá</a></li>
                      </ul> -->
                  </li>
                  <li class="level1">
                    <a class="hmega">Giày, dép</a>
                    <ul class="level1">
                      <li class="level2"><a href="./product.jsp">Bóng đá</a></li>
                      <li class="level2"><a href="./product.jsp">Chạy</a></li>
                      <li class="level2"><a href="./product.jsp">Cầu lông</a></li>
                      <li class="level2"><a href="./product.jsp">Bóng rổ</a></li>
                      <li class="level2"><a href="./product.jsp">Quần vợt</a></li>
                    </ul>
                  </li>
                  <li class="level1">
                    <a class="hmega">Quần, áo</a>
                    <ul class="level1">
                      <li class="level2"><a href="./product.jsp">Bóng đá</a></li>
                      <li class="level2"><a href="./product.jsp">Chạy</a></li>
                      <li class="level2"><a href="./product.jsp">Cầu lông</a></li>
                      <li class="level2"><a href="./product.jsp">Bóng rổ</a></li>
                      <li class="level2"><a href="./product.jsp">Quần vợt</a></li>
                    </ul>
                  </li>
                  <li class="level1">
                    <a class="hmega">Phụ kiện</a>
                    <ul class="level1">
                      <li class="level2"><a href="./product.jsp">Bóng đá</a></li>
                      <li class="level2"><a href="./product.jsp">Chạy</a></li>
                      <li class="level2"><a href="./product.jsp">Cầu lông</a></li>
                      <li class="level2"><a href="./product.jsp">Bóng rổ</a></li>
                      <li class="level2"><a href="./product.jsp">Quần vợt</a></li>
                      <li class="level2"><a href="./product.jsp">Bơi lội</a></li>
                      <li class="level2"><a href="./product.jsp">Golf</a></li>
                    </ul>
                  </li>
                </ul>
                <div class="col-4">
                  <a href="">
                    <picture>
                      <img src="https://media.giphy.com/media/mj7HcKFq23oobJMcOG/giphy.gif" alt="" width="80%">
                    </picture>
                  </a>
                </div>
              </div>
            </div>
          </li>
          <li class="header_nav-list-item"><a href="./news.jsp">Tin tức</a></li>
          <li class="header_nav-list-item"><a href="./contact.jsp">Liên hệ</a></li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- end header -->
      <!-- product detail -->
      <div class="container">
      <div class="product__detail">
          <div class="row product__detail-row">
            <div class="col-lg-6 col-12 daonguoc">
              <div class="img-product">
                <ul class="all-img">
                  <li class="img-item">
                    <img src="./img/product/ult1.jpg" class="small-img" alt="anh 1" onclick="changeImg('one')" id="one">
                  </li>
                  <li class="img-item">
                    <img src="./img/product/addidas1.jpg" class="small-img" alt="anh 2" onclick="changeImg('two')" id="two">
                  </li>
                  <li class="img-item">
                    <img src="./img/product/giayxanh.jpg" class="small-img" alt="anh 3" onclick="changeImg('three')" id="three">
                  </li>
                  <li class="img-item">
                    <img src="./img/product/giayxah2.jpg" class="small-img" alt="anh 4" onclick="changeImg('four')" id="four">
                  </li>
                  
                </ul>
              </div>
              <div id="main-img" style="cursor: pointer;" >
                <img src="./img/product/ult1.jpg" class="big-img" alt="ảnh chính" id="img-main" xoriginal="./img/product/ult1.jpg">
                <div class="sale-off sale-off-2">
                  <span class="sale-off-percent">20%</span>
                  <span class="sale-off-label">GIẢM</span>
                </div>
              </div>
            </div>
            <div class="col-lg-6 col-12">
              <div class="product__name">
                <h2>NIKE MERCURIAL SUPERFLY 8 ACADEMY TF – CV0953-107 - TRẮNG/BẠC SAFARI</h2>
              </div>
              <div class="status-product">
                Trạng thái: <b>Còn hàng</b>
              </div>
              <div class="infor-oder">
                Loại sản phẩm: <b>Giày dép</b>
              </div>
              <div class="product__price">
                <h2>550.000đ</h2>
              </div>

              <div class="price-old">
                Giá gốc: 
                <del>650.000đ</del>
                <span class="discount">(-20%)</span>
              </div>
              <!-- <div class="product__color">
                <div class="select-swap">
                  <div class="circlecheck">
                    <input type="radio" id="f-option" class="circle-1" name="selector" checked>
                    <label for="f-option">Radio Mint Color</label>
                    
                    <div class="outer-circle"></div>
                  </div>
                  <div class="circlecheck">
                    <input type="radio" id="g-option" class="circle-2" name="selector">
                    <label for="g-option">Radio Orange Color</label>
                    
                    <div class="outer-circle"></div>
                  </div>
                  <div class="circlecheck">
                    <input type="radio" id="h-option" class="circle-3" name="selector">
                    <label for="h-option">Radio Purple Color</label>
                    
                    <div class="outer-circle"></div>
                  </div>
                  
                </div>
              </div> -->
              <div class="product__color d-flex" style="align-items: center;">
                <div class="title" style="font-size: 16px; margin-right: 10px;">
                  Màu: 
                </div>
                <div class="select-swap d-flex">
                  
                  <div class="circlecheck">
                    <input type="radio" id="f-option" class="circle-1" name="selector" data-image="./img/product/ult1.jpg" checked>
                    <label for="f-option"></label>
                    <div class="outer-circle"></div>
                  </div>
                  <div class="circlecheck">
                    <input type="radio" id="g-option" class="circle-2" name="selector" data-image="./img/product/addidas1.jpg">
                    <label for="g-option"></label>
                    <div class="outer-circle"></div>
                  </div>
                  <div class="circlecheck">
                    <input type="radio" id="h-option" class="circle-3" name="selector" data-image="./img/product/giayxanh.jpg">
                    <label for="h-option"></label>
                    <div class="outer-circle"></div>
                  </div>
                </div>
              </div>
              <div class="product__size d-flex" style="align-items: center;">
                <div class="title" style="font-size: 16px; margin-right: 10px;">
                  Kích thước: 
                </div>
                <div class="select-swap">
                    <div class="swatch-element" data-value="38">
                      <input type="radio" class="variant-1" id="swatch-1-38" name="mau" value="trung" onclick="check()">
                      <label for="swatch-1-38" class="sd"><span>38</span></label>
                    </div>
                    <div class="swatch-element" data-value="39">
                      <input type="radio" class="variant-1" id="swatch-1-39" name="mau" value="thanh" onclick="check()">
                      <label for="swatch-1-39" class="sd"><span>39</span></label>
                    </div>
                    <div class="swatch-element" data-value="40" >
                      <input type="radio" class="variant-1" id="swatch-1-40" name="mau" value="hieu" onclick="check()">
                      <label for="swatch-1-40" class="sd"><span>40</span></label>
                    </div>
                </div>
              </div>
              <div class="product__wrap">
                <div class="product__amount">
                  <label for="">Số lượng: </label>
                  <input type="button" value="-" class="control" onclick="tru()" id="cong">
                  <input type="text" value="1" class="text-input" id="text_so_luong" onkeypress='validate(event)'> 
                  <input type="button" value="+" class="control" onclick="cong()">
                </div>
                <button class="add-cart" onclick="fadeInModal()">Thêm vào giỏ</button>
              </div>
              <div class="product__shopnow">
                <button class="shopnow">Mua ngay</button>
                <span class="home-product-item__like home-product-item__like--liked">
                  <i class="home-product-item__like-icon-empty far fa-heart" style="font-size: 24px;margin-top: 7px;"></i>
                  <i class="home-product-item__like-icon-fill fas fa-heart" style="font-size: 24px;margin-top: 7px;"></i>
                </span>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="product__describe">
        <div class="container">
          <h2 class="product__describe-heading">Mô tả</h2>
          <div class="row">
            <div class="col-1"></div>
            <div class="col-11">
              <h3 class="name__product">NIKE MERCURIAL SUPERFLY 8 ACADEMY TF</h3>
              <h3>Thông số kĩ thuật: </h3>
              <p>Phân khúc: Academy (tầm trung).</p>
              <p>Upper: Synthetic - Da tổng hợp cao cấp.</p>
              <p>Thiết kế đinh giày: Các đinh cao su hình chữ nhật, xếp chồng chéo với nhau. Theo đánh giá của nhiều người chơi thì những đinh TF hình chữ nhật lần này giúp đôi giày có thể trụ vững hơn trên sân.</p>
              <p>Độ ôm chân: Cao</p>
              <p>Bộ sưu tập: SAFARI PACK - Ra mắt tháng 4/2021</p>
              <p>PTrên chân các cầu thủ nổi tiếng như: Cristiano Ronaldo, Kylian Mbappé, Erling Haaland, Jadon Sancho, Leroy Sané, Romelu Lukaku...</p>  
            </div>
          </div>
        </div>
      </div>
      <div class="product__comment">
        <div class="container">
          <h2 class="product__describe-heading">Bình luận</h2>
          <div class="row">
            <div class="col-lg-4 col-12 mb-4">
              <div class="home-product-item__rating" style="font-size: 24px;transform-origin: left;margin-bottom: 5px">
                <i class="home-product-item__star--gold fas fa-star"></i>
                <i class="home-product-item__star--gold fas fa-star"></i>
                <i class="home-product-item__star--gold fas fa-star"></i>
                <i class="home-product-item__star--gold fas fa-star"></i>
                <i class="fas fa-star"></i>
              </div>
              <textarea name="" id="" cols="70" rows="10"></textarea>
              <button type="submit" class="btn btn-comment">Gửi</button>
            </div>
            <div class="col-lg-8 col-12">
              <div class="body__comment">
                <div class="comment" style="align-items: center;">
                  <img class="comment-img" src="./img/product/noavatar.png" alt="" >
                  <div class="comment__content">
                    <div class="comment__content-heding">
                      <h4 class="comment__content-name">Nguyễn Quốc Trung</h4>
                      <span class="comment__content-time">2021-11-12</span>
                    </div>
                    <div class="home-product-item__rating" style="font-size: 14px;transform-origin: left;margin-bottom: 5px">
                      <i class="home-product-item__star--gold fas fa-star"></i>
                      <i class="home-product-item__star--gold fas fa-star"></i>
                      <i class="home-product-item__star--gold fas fa-star"></i>
                      <i class="home-product-item__star--gold fas fa-star"></i>
                      <i class="fas fa-star"></i>
                    </div>
                    <div class="comment__content-content">
                      <span>Đẹp quá</span>
                    </div>
                  </div>
                </div>
                <div class="comment">
                  <img class="comment-img" src="./img/product/noavatar.png" alt="" >
                  <div class="comment__content">
                    <div class="comment__content-heding">
                      <h4 class="comment__content-name">Nguyễn Quốc Trung</h4>
                      <span class="comment__content-time">2021-11-12</span>
                    </div>
                    <div class="home-product-item__rating" style="font-size: 14px;transform-origin: left;margin-bottom: 5px">
                      <i class="home-product-item__star--gold fas fa-star"></i>
                      <i class="home-product-item__star--gold fas fa-star"></i>
                      <i class="home-product-item__star--gold fas fa-star"></i>
                      <i class="home-product-item__star--gold fas fa-star"></i>
                      <i class="fas fa-star"></i>
                    </div>
                    <div class="comment__content-content">
                      <span>Quá đẹp</span>
                    </div>
                  </div>
                </div>
                <div class="comment">
                  <img class="comment-img" src="./img/product/noavatar.png" alt="" >
                  <div class="comment__content">
                    <div class="comment__content-heding">
                      <h4 class="comment__content-name">Nguyễn Quốc Trung</h4>
                      <span class="comment__content-time">2021-11-12</span>
                    </div>
                    <div class="home-product-item__rating" style="font-size: 14px;transform-origin: left;margin-bottom: 5px">
                      <i class="home-product-item__star--gold fas fa-star"></i>
                      <i class="home-product-item__star--gold fas fa-star"></i>
                      <i class="home-product-item__star--gold fas fa-star"></i>
                      <i class="home-product-item__star--gold fas fa-star"></i>
                      <i class="fas fa-star"></i>
                    </div>
                    <div class="comment__content-content">
                      <span>Đẹp quá</span>
                    </div>
                  </div>
                </div>
                <div class="comment">
                  <img class="comment-img" src="./img/product/noavatar.png" alt="" >
                  <div class="comment__content">
                    <div class="comment__content-heding">
                      <h4 class="comment__content-name">Nguyễn Quốc Trung</h4>
                      <span class="comment__content-time">2021-11-12</span>
                    </div>
                    <div class="home-product-item__rating" style="font-size: 14px;transform-origin: left;margin-bottom: 5px">
                      <i class="home-product-item__star--gold fas fa-star"></i>
                      <i class="home-product-item__star--gold fas fa-star"></i>
                      <i class="home-product-item__star--gold fas fa-star"></i>
                      <i class="home-product-item__star--gold fas fa-star"></i>
                      <i class="fas fa-star"></i>
                    </div>
                    <div class="comment__content-content">
                      <span>Sản phẩm tốt</span>
                    </div>
                  </div>
                </div>
                <!-- <div class="comment">
                  <img class="comment-img" src="./img/product/noavatar.png" alt="" >
                  <div class="comment__content">
                    <div class="comment__content-heding">
                      <h4 class="comment__content-name">Nguyễn Quốc Trung</h4>
                      <span class="comment__content-time">2021-11-12</span>
                    </div>
                    <div class="home-product-item__rating" style="font-size: 14px;transform-origin: left;margin-bottom: 5px">
                      <i class="home-product-item__star--gold fas fa-star"></i>
                      <i class="home-product-item__star--gold fas fa-star"></i>
                      <i class="home-product-item__star--gold fas fa-star"></i>
                      <i class="home-product-item__star--gold fas fa-star"></i>
                      <i class="fas fa-star"></i>
                    </div>
                    <div class="comment__content-content">
                      <span>Sản phẩm tốt</span>
                    </div>
                  </div>
                </div> -->
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- end product detail -->
      <!-- product relate to -->
      <div class="product__relateto">
        <div class="container">
          <h3 class="product__relateto-heading">Sản phẩm liên quan</h3>
          <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-12 mb-20">
              <a href="./productDetail.jsp" class="product__new-item">
                <div class="card" style="width: 100%">
                  <div>
                    <img class="card-img-top" src="./img/product/aohoodie1.jpg" alt="Card image cap">
                    <!-- <form action="" class="hover-icon hidden-sm hidden-xs">
                      <input type="hidden">
                      <a href="./pay.jsp" class="btn-add-to-cart" title="Mua ngay">
                        <i class="fas fa-cart-plus"></i>
                      </a>
                      <a data-toggle="modal" data-target="#myModal" class="quickview" title="Xem nhanh">
                        <i class="fas fa-search"></i>
                      </a>
                    </form> -->
                  </div>
                  <div class="card-body">
                    <h5 class="card-title custom__name-product">
                      Hoodie Adidas
                    </h5>
                    <div class="product__price">
                      <p class="card-text price-color product__price-old">1,000,000 đ</p>
                      <p class="card-text price-color product__price-new">1,000,000 đ</p>
                    </div>
                    <div class="home-product-item__action">
                      <span class="home-product-item__like home-product-item__like--liked">
                          <i class="home-product-item__like-icon-empty far fa-heart"></i>
                          <i class="home-product-item__like-icon-fill fas fa-heart"></i>
                      </span>
                      <div class="home-product-item__rating">
                          <i class="home-product-item__star--gold fas fa-star"></i>
                          <i class="home-product-item__star--gold fas fa-star"></i>
                          <i class="home-product-item__star--gold fas fa-star"></i>
                          <i class="home-product-item__star--gold fas fa-star"></i>
                          <i class="fas fa-star"></i>
                      </div>
                      <span class="home-product-item__sold">79 đã bán</span>
                    </div>
                    <div class="sale-off">
                      <span class="sale-off-percent">20%</span>
                      <span class="sale-off-label">GIẢM</span>
                    </div>
                  </div>
                </div>
              </a>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 mb-20">
              <a href="./productDetail.jsp" class="product__new-item">
                <div class="card" style="width: 100%">
                  <div>
                    <img class="card-img-top" src="./img/product/aohoodie1.jpg" alt="Card image cap">
                    <!-- <form action="" class="hover-icon hidden-sm hidden-xs">
                      <input type="hidden">
                      <a href="./pay.jsp" class="btn-add-to-cart" title="Mua ngay">
                        <i class="fas fa-cart-plus"></i>
                      </a>
                      <a data-toggle="modal" data-target="#myModal" class="quickview" title="Xem nhanh">
                        <i class="fas fa-search"></i>
                      </a>
                    </form> -->
                  </div>
                  <div class="card-body">
                    <h5 class="card-title custom__name-product">
                      Hoodie Adidas
                    </h5>
                    <div class="product__price">
                      <p class="card-text price-color product__price-old">1,000,000 đ</p>
                      <p class="card-text price-color product__price-new">1,000,000 đ</p>
                    </div>
                    <div class="home-product-item__action">
                      <span class="home-product-item__like home-product-item__like--liked">
                          <i class="home-product-item__like-icon-empty far fa-heart"></i>
                          <i class="home-product-item__like-icon-fill fas fa-heart"></i>
                      </span>
                      <div class="home-product-item__rating">
                          <i class="home-product-item__star--gold fas fa-star"></i>
                          <i class="home-product-item__star--gold fas fa-star"></i>
                          <i class="home-product-item__star--gold fas fa-star"></i>
                          <i class="home-product-item__star--gold fas fa-star"></i>
                          <i class="fas fa-star"></i>
                      </div>
                      <span class="home-product-item__sold">79 đã bán</span>
                    </div>
                    <div class="sale-off">
                      <span class="sale-off-percent">20%</span>
                      <span class="sale-off-label">GIẢM</span>
                    </div>
                  </div>
                </div>
              </a>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 mb-20">
              <a href="./productDetail.jsp" class="product__new-item">
                <div class="card" style="width: 100%">
                  <div>
                    <img class="card-img-top" src="./img/product/aohoodie1.jpg" alt="Card image cap">
                    <!-- <form action="" class="hover-icon hidden-sm hidden-xs">
                      <input type="hidden">
                      <a href="./pay.jsp" class="btn-add-to-cart" title="Mua ngay">
                        <i class="fas fa-cart-plus"></i>
                      </a>
                      <a data-toggle="modal" data-target="#myModal" class="quickview" title="Xem nhanh">
                        <i class="fas fa-search"></i>
                      </a>
                    </form> -->
                  </div>
                  <div class="card-body">
                    <h5 class="card-title custom__name-product">
                      Hoodie Adidas
                    </h5>
                    <div class="product__price">
                      <p class="card-text price-color product__price-old">1,000,000 đ</p>
                      <p class="card-text price-color product__price-new">1,000,000 đ</p>
                    </div>
                    <div class="home-product-item__action">
                      <span class="home-product-item__like home-product-item__like--liked">
                          <i class="home-product-item__like-icon-empty far fa-heart"></i>
                          <i class="home-product-item__like-icon-fill fas fa-heart"></i>
                      </span>
                      <div class="home-product-item__rating">
                          <i class="home-product-item__star--gold fas fa-star"></i>
                          <i class="home-product-item__star--gold fas fa-star"></i>
                          <i class="home-product-item__star--gold fas fa-star"></i>
                          <i class="home-product-item__star--gold fas fa-star"></i>
                          <i class="fas fa-star"></i>
                      </div>
                      <span class="home-product-item__sold">79 đã bán</span>
                    </div>
                    <div class="sale-off">
                      <span class="sale-off-percent">20%</span>
                      <span class="sale-off-label">GIẢM</span>
                    </div>
                  </div>
                </div>
              </a>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 mb-20">
              <a href="./productDetail.jsp" class="product__new-item">
                <div class="card" style="width: 100%">
                  <div>
                    <img class="card-img-top" src="./img/product/aohoodie1.jpg" alt="Card image cap">
                    <!-- <form action="" class="hover-icon hidden-sm hidden-xs">
                      <input type="hidden">
                      <a href="./pay.jsp" class="btn-add-to-cart" title="Mua ngay">
                        <i class="fas fa-cart-plus"></i>
                      </a>
                      <a data-toggle="modal" data-target="#myModal" class="quickview" title="Xem nhanh">
                        <i class="fas fa-search"></i>
                      </a>
                    </form> -->
                  </div>
                  <div class="card-body">
                    <h5 class="card-title custom__name-product">
                      Hoodie Adidas
                    </h5>
                    <div class="product__price">
                      <p class="card-text price-color product__price-old">1,000,000 đ</p>
                      <p class="card-text price-color product__price-new">1,000,000 đ</p>
                    </div>
                    <div class="home-product-item__action">
                      <span class="home-product-item__like home-product-item__like--liked">
                          <i class="home-product-item__like-icon-empty far fa-heart"></i>
                          <i class="home-product-item__like-icon-fill fas fa-heart"></i>
                      </span>
                      <div class="home-product-item__rating">
                          <i class="home-product-item__star--gold fas fa-star"></i>
                          <i class="home-product-item__star--gold fas fa-star"></i>
                          <i class="home-product-item__star--gold fas fa-star"></i>
                          <i class="home-product-item__star--gold fas fa-star"></i>
                          <i class="fas fa-star"></i>
                      </div>
                      <span class="home-product-item__sold">79 đã bán</span>
                    </div>
                    <div class="sale-off">
                      <span class="sale-off-percent">20%</span>
                      <span class="sale-off-label">GIẢM</span>
                    </div>
                  </div>
                </div>
              </a>
            </div>
          </div>
          <div class="seemore">
            <a href="./product.jsp">Xem thêm</a>
          </div>
        </div>
      </div>
      <!-- end  product relate to-->
      <!-- footer -->
  <footer class="footer">
    <div class="container">
      <div class="row">
        <div class="col-sm-12 col-md-6 col-lg-3">
          <img src="./img/logo/logomain.png" alt="" width="100px" height="100px"
            style="border-radius: 50%;border: 3px solid #000;margin-bottom: 20px;">
          <ul class="footer__list">
            <li class="footer__item">
              <p><i class="fas fa-search-location footer__item-icon"></i> Ho Chi Minh, Viet Nam</p>
            </li>
            <li class="footer__item">
              <p><i class="fas fa-phone-square-alt footer__item-icon"></i> Phone: <a
                  href="tel:0123456789">0123456789</a></p>
            </li>
            <li class="footer__item">
              <p><i class="fas fa-envelope-square footer__item-icon"></i> Email: <a
                  href="mailto:abc@gmail.com">abc@gmail.com</a></p>
            </li>
            <li>
              <a href=""><i class="fab fa-facebook" style="font-size: 24px; margin-right: 10px"></i></a>
              <a href=""><i class="fab fa-instagram" style="font-size: 24px; margin-right: 10px;color: pink;"></i></a>
              <a href=""><i class="fab fa-youtube" style="font-size: 24px; margin-right: 10px;color: red;"></i></a>
              <a href=""><i class="fab fa-twitter" style="font-size: 24px; margin-right: 10px"></i></a>
            </li>
          </ul>
        </div>
        <div class="col-sm-12 col-md-6 col-lg-3">
          <div style="display: flex;justify-content:space-between;cursor: pointer;margin-bottom: 8px;"
            data-toggle="collapse" data-target="#demo2">
            <h3 class="footer__heading">Thông tin của chúng tôi</h3><i class="fas fa-chevron-down checkdl1"></i>
          </div>
          <ul class="footer__list collapse show" id="demo2">
            <li class="footer__item">
              <a href="" class="footer__item--link">Cơ sở 1: 26 Đường D1, P12, Quận Tân Bình, TP.HCM</a>
            </li>
            <li class="footer__item">
              <a href="" class="footer__item--link">Cơ sở 2: 86 Đinh Bộ Lĩnh, P10, Quận Bình Thanh, TP.HCM</a>
            </li>
            <li class="footer__item">
              <a href="" class="footer__item--link">Lĩnh vực kinh doanh</a>
            </li>
          </ul>
        </div>
        <div class="col-sm-12 col-md-6 col-lg-3">
          <div style="display: flex;justify-content:space-between;cursor: pointer;margin-bottom: 8px;"
            data-toggle="collapse" data-target="#demo1">
            <h3 class="footer__heading">Chính sách</h3><i class="fas fa-chevron-down checkdl1"></i>
          </div>
          <ul class="footer__list collapse show" id="demo1">
            <li class="footer__item">
              <a href="" class="footer__item--link">Chính sách bảo hành</a>
            </li>
            <li class="footer__item">
              <a href="" class="footer__item--link">Chính sách đổi trả</a>
            </li>
            <li class="footer__item">
              <a href="" class="footer__item--link">Chính sách thanh toán</a>
            </li>
            <li class="footer__item">
              <a href="" class="footer__item--link">Chính sách giao nhận hàng</a>
            </li>
            <li class="footer__item">
              <a href="" class="footer__item--link">Chính sách bảo mật</a>
            </li>
          </ul>
        </div>
        <div class="col-sm-12 col-md-6 col-lg-3">
          <div style="display: flex;justify-content:space-between;cursor: pointer;margin-bottom: 8px;"
            data-toggle="collapse" data-target="#demo">
            <h3 class="footer__heading">Hỗ trợ chung</h3><i class="fas fa-chevron-down checkdl1"></i>
          </div>
          <ul class="footer__list collapse show" id="demo">
            <li class="footer__item">
              <a href="./index.jsp" class="footer__item--link">Trang chủ</a>
            <li class="footer__item">
              <a href="./intro.jsp" class="footer__item--link">Giới thiệu</a>
            </li>
            <li class="footer__item">
              <a href="./product.jsp" class="footer__item--link">Sản phẩm</a>
            </li>
            <li class="footer__item">
              <a href="./news.jsp" class="footer__item--link">Tin tức</a>
            </li>
            <li class="footer__item">
              <a href="./contact.jsp" class="footer__item--link">Liên hệ</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="footer__bottom">
      <p class="footer__text">© Bản quyền thuộc về P&T Shop</p>
    </div>
  </footer>
  <div id="go-to-top">
    <a class="btn-gototop"><i class="fas fa-arrow-up"></i></a>
  </div>
  <!-- end footer -->

      <div id="alert-cart" class="alert" style="display:none">
        <div class="alert__heading">
            <h4>Thêm vào giỏ hàng</h4>
        </div>
        <div class="alert__body">
            <img src="./img/product/addidas1.jpg" alt="" class="alert__body-img">
            <div>
                <h5 class="alert__body-name"></h5>
                
                <span class="alert__body-amount">Số lượng: 1</span>
                <h6 class="alert__body-price">2.000.000 VNĐ</h6>
            </div>
        </div>
        <div class="alert__footer">
            <a class="click__cart" style="border-radius: 4px">Xem giỏ hàng</a>
        </div>
      </div>
      <div class="overlay1" style="display: none" onclick="fadeout()">
      
      </div>  
<!-- Floating Reel Popup -->
<div id="reel-popup" class="reel-popup">
    <video src="./img/logo/A.mp4" autoplay muted loop playsinline class="reel-popup-video"></video>
    <div class="reel-popup-overlay">
        <span><i class="fas fa-video"></i> Xem Reels</span>
    </div>
</div>

<!-- Reel Modal -->
<div id="reel-modal" class="reel-modal-overlay hidden">
    <div class="reel-modal-content">
        <button class="reel-close-btn">&times;</button>
        <div class="reel-video-container">
            <video id="reel-video-player" src="./img/logo/A.mp4" controls autoplay muted playsinline></video>
        </div>
        <button class="reel-nav-btn prev">&#10094;</button>
        <button class="reel-nav-btn next">&#10095;</button>
    </div>
</div>
</body>
      <script src="js/main.js" type="text/javascript"></script>
      <script src="js/zoomsl.min.js" type="text/javascript"></script>
      <script>
        $(document).ready(function(){
          $(".big-img").imagezoomsl({
            zoomrange: [3, 3]
            
          });
        });
      </script>
<script>
  function fadeInModal()
  {
      $('.alert').fadeIn();   
      $('.overlay1').fadeIn(); 
  }
  function fadeOutModal()
  {
      $('.alert').fadeOut();
      $('.overlay1').fadeOut();
  }
  function fadeout()
  {
      $('.overlay1').fadeOut();
      $('.alert').fadeOut();
  }
  setInterval(fadeOutModal, 7000);

  $(document).ready(function(){
    $('input[name="selector"]').on('change', function(){
      var newImage = $(this).data('image');
      $('#img-main').attr('src', newImage);
      // If you are using a zoom plugin, you might need to update it as well
      $(".big-img").attr('src', newImage).trigger('destroy.zoomsl').imagezoomsl({
        zoomrange: [3, 3]
      });
    });
  });
</script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    const reelPopup = document.getElementById('reel-popup');
    const reelModal = document.getElementById('reel-modal');
    const closeReelBtn = document.querySelector('.reel-close-btn');
    const videoPlayer = document.getElementById('reel-video-player');
    const popupVideo = document.querySelector('.reel-popup-video');
    const prevBtn = document.querySelector('.reel-nav-btn.prev');
    const nextBtn = document.querySelector('.reel-nav-btn.next');

    // Hardcoded list of video URLs
    const videoPlaylist = [
        './img/logo/A.mp4',
        './video/vid2.mp4', // Placeholder - replace with actual video paths
        './video/vid3.mp4'  // Placeholder
        // Add up to 10-15 video paths here
    ];

    let currentVideoIndex = 0;

    // --- Draggable Popup Logic ---
    let isDragging = false;
    let offsetX, offsetY;
    let hasDragged = false;

    reelPopup.addEventListener('mousedown', function(e) {
        isDragging = true;
        hasDragged = false;
        // Calculate offset from the top-left corner of the element
        offsetX = e.clientX - reelPopup.getBoundingClientRect().left;
        offsetY = e.clientY - reelPopup.getBoundingClientRect().top;
        reelPopup.style.cursor = 'grabbing';
        // We prevent text selection while dragging
        e.preventDefault();
    });

    document.addEventListener('mousemove', function(e) {
        if (isDragging) {
            hasDragged = true;
            // Calculate new position
            let newX = e.clientX - offsetX;
            let newY = e.clientY - offsetY;

            // Boundary checks to keep it within the viewport
            newX = Math.max(0, Math.min(newX, window.innerWidth - reelPopup.offsetWidth));
            newY = Math.max(0, Math.min(newY, window.innerHeight - reelPopup.offsetHeight));

            reelPopup.style.left = newX + 'px';
            reelPopup.style.top = newY + 'px';
            reelPopup.style.bottom = 'auto'; // Override the 'bottom' property
            reelPopup.style.right = 'auto'; // Override the 'right' property
        }
    });

    document.addEventListener('mouseup', function() {
        isDragging = false;
        reelPopup.style.cursor = 'grab';
    });

    // --- End Draggable Popup Logic ---

    function showModal() {
        reelModal.classList.remove('hidden');
        // Sync the main modal video with the popup video and play
        videoPlayer.src = popupVideo.src;
        videoPlayer.currentTime = popupVideo.currentTime;
        videoPlayer.play();
    }

    function hideModal() {
        reelModal.classList.add('hidden');
        videoPlayer.pause();
    }

    function playVideo(index) {
        if (index >= 0 && index < videoPlaylist.length) {
            currentVideoIndex = index;
            const newSrc = videoPlaylist[currentVideoIndex];
            videoPlayer.src = newSrc;
            popupVideo.src = newSrc; // Also update the small popup video
            videoPlayer.play();
        }
    }

    reelPopup.addEventListener('click', function() {
        // Only open modal if the user hasn't dragged the element
        if (!hasDragged) {
            showModal();
        }
    });
    closeReelBtn.addEventListener('click', hideModal);
    reelModal.addEventListener('click', function(event) {
        if (event.target === reelModal) {
            hideModal();
        }
    });

    prevBtn.addEventListener('click', function() {
        let prevIndex = (currentVideoIndex - 1 + videoPlaylist.length) % videoPlaylist.length;
        playVideo(prevIndex);
    });

    nextBtn.addEventListener('click', function() {
        let nextIndex = (currentVideoIndex + 1) % videoPlaylist.length;
        playVideo(nextIndex);
    });

    // Go to next video when current one ends
    videoPlayer.addEventListener('ended', function() {
        nextBtn.click();
    });
});
</script>
</html>
