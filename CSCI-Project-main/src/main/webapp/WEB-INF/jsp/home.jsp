<%@ include file="navbar.jsp" %>
<style>
    <%@include file="/WEB-INF/css/homepage.css" %>
</style>
<head>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <title>Spotlight Cinemas Home</title>
</head>
<div class="video-background">
    <div class="video-foreground">
        <iframe src="https://www.youtube.com/embed/w1pgqNJAoTw?playlist=g8yL0AY54uw&rel=0&modestbranding=1&autohide=1&mute=1&showinfo=0&controls=0&autoplay=1&loop=1&start=60"
                width="560" height="315" allowfullscreen></iframe>
    </div>
</div>
<div id="welcome-message">
    <div class="vid-info">
        <h1>Welcome to Spotlight Cinemas</h1>
        <h4>Now showing Star Wars: The Clone Wars</h4>
        <br>
        <button type="button" class="btn btn-primary"
                onclick="location.href = '${pageContext.request.contextPath}/moviegallery';">Book movies
        </button>
    </div>
</div>
<div id="showing">
    <div class="vid-info2">
        <h1><span class="display-5">Now Showing</span></h1>
    </div>
</div>
<div class="container" style="margin-top: 30%; width: 100%;">
    <div class="owl-one owl-carousel">
        <div class="card"><a href="https://www.youtube.com/watch?v=ZLW2jkd6E7g"><img
                src="https://i.pinimg.com/originals/92/dc/28/92dc28398f485b17ab6cf8d28f06bff3.png" alt=""></a></div>
        <div class="card"><a href="https://www.youtube.com/watch?v=NyV0BvZq7vA"><img
                src="https://amc-theatres-res.cloudinary.com/image/upload/f_auto,fl_lossy,h_465,q_auto,w_310/v1631623901/amc-cdn/production/2/movies/66600/66601/Poster/Primary_BoxCover_800_1200.jpg"
                alt=""></a></div>
        <div class="card"><a href="https://www.youtube.com/watch?v=ybji16u608U"><img
                src="https://amc-theatres-res.cloudinary.com/image/upload/f_auto,fl_lossy,h_465,q_auto,w_310/v1631623883/amc-cdn/production/2/movies/66100/66056/Poster/p_800x1200_AMC_BlackWidow_072621.jpg"
                alt=""></a></div>
        <div class="card"><a href="https://www.youtube.com/watch?v=39udgGPyYMg"><img
                src="https://media.vanityfair.com/photos/592592596736887ada186bcd/master/w_1600%2Cc_limit/spider-man-homecoming-SMH_DOM_Online_FNL_1SHT_3DRD3DIMX_AOJ_300dpi_01_rgb.jpg"
                alt=""></a></div>
        <div class="card"><a href="https://www.youtube.com/watch?v=TcMBFSGVi1c"><img
                src="https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/d1pklzbuyaab0la-1552597012.jpg"
                alt=""></a></div>
    </div>
</div>
<div id="coming-soon">
    <div class="vid-info3">
        <h1><span class="display-5">Coming soon</span></h1>
    </div>
</div>
<div class="container" style="margin-top: 8%; width: 100%;">
    <div class="owl-two owl-carousel">
        <div class="card"><a href="#"><img
                src="https://img.gurugamer.com/resize/740x-/2020/04/10/doctor-strange-in-the-multiverse-of-madness-poster-0882.png"
                alt=""></a></div>
        <div class="card"><a href="https://www.youtube.com/watch?v=rt-2cxAiPJk"><img
                src="https://cdna.artstation.com/p/assets/images/images/035/182/626/medium/rodrigo-castello-spidermannowayhome-rodrigocastellogaya.jpg"
                alt=""></a></div>
        <div class="card"><a href="https://www.youtube.com/watch?v=-FmWuCgJmxo"><img
                src="https://oyster.ignimgs.com/wordpress/stg.ign.com/2021/05/VNM2_OnLine_1400x2100_TSR_RD3DDCIMAX_02.jpg"
                alt=""></a></div>
        <div class="card"><img
                src="https://static.wikia.nocookie.net/the-batman-universe/images/4/45/The_Batman_-_Key_Art_Poster.jpg"
                alt=""></div>
        <div class="card"><img
                src="https://pbs.twimg.com/media/EwWn7ilWQAAEBM0?format=jpg"
                alt=""></div>
    </div>
</div>
<script>
    $('.owl-one').owlCarousel({
        autoplay: true,
        autoplayTimeout: 2000,
        autoplayHoverPause: true,
        loop: true,
        margin: 30,
        items: 4,
        smartSpeed: 600,
        fluidSpeed: true,
        nav: true,
        dots: true
    });
    $('.owl-two').owlCarousel({
        autoplay: true,
        autoplayTimeout: 2000,
        autoplayHoverPause: true,
        loop: true,
        rtl: true,
        margin: 30,
        items: 4,
        smartSpeed: 600,
        fluidSpeed: true,
        nav: true,
        dots: true
    });
</script>