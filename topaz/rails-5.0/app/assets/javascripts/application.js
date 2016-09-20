// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(setup);

function setup() {
    var delegates = $('article.delegate');
    delegates.each(delegate);
}

function delegate() {
    var jel = $(this);
    var url = jel.attr('data-delegate-url');
    var query = jel.attr('data-delegate-params');
    if (typeof query == typeof undefined || query == false) {
        query = '';
    }
    else {
        query = '?' + query;
    }
    var req = new XMLHttpRequest();
    req.onload = function() {
        //jel.html(this.responseXML);
        jel.html(this.responseText);
    };
    req.open("GET",url+query);
    //req.responseType = "document";
    req.send();
}