// Custom scripts goes here
(function() {
    
    // Initialize carousel
    carouselInit();  

    // Portfolio filters function
    portfolioFilters();

})();


// Function to animate the height of carousel in case of slides with different heights
function carouselInit() {
    var carousel = $('#myCarousel'),
        defaultHeight = carousel.find('.active').height();

    // setting the default height
    carousel.css('min-height', defaultHeight);

    // animate the container height on any slider transitiom
    carousel.bind('slid', function() {
        var itemheight = carousel.find('.active').height();

        carousel.css('min-height', itemheight);
        carousel.animate({
            height: itemheight
        }, 50 );
    });
}


function portfolioFilters() {
    var filters = $('.thumbnail-filters');
    
    filters.on('click', 'a', function(e) {
        var active = $(this),
            portfolio = filters.next();
            activeClass = active.data('filter');

        
        filters.find('a').removeClass('active');
        active.addClass('active');
        
        if ( activeClass == 'all') {
            portfolio.find('li').removeClass('inactive');
        } else {
            portfolio.find('li').removeClass('inactive').not('.filter-' + activeClass ).addClass('inactive');
        }
        

        e.preventDefault();
    });
}