/* dance.js
 * JS magic for the TV4 Let's Dance demo
 * Written by Pär Karlsson <feinorgh@gmail.com>
 * */

function loadVideoList(target, tag, page) {
    'use strict';
    $.get('videolist/' + tag,
            { page : page }
    )
    .done(function(fragment) {
        target.fadeOut(function() {
            target.html(fragment);
            target.find('a.videopage').click(function(event) {
                event.preventDefault();
                var page = $(this).data('page');
                loadVideoList(target, tag, page);
                return target;
            });
            target.fadeIn();
        });
    });
    return target;
}

$( document ).ready(function() {
    'use strict';
    $('div.videolist').each(function() {
        var target = $(this);
        var tag    = $(this).data('person-tag');
        var page   = 1;
        loadVideoList(target, tag, page);
    });
});
