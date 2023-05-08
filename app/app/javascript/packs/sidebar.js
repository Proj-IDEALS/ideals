

$(document).ready(function () {
    window.sidebar_status=0;
    document.querySelector("#mobile-menu-inner").onclick = function toggleSidebar(){
        if (window.sidebar_status==0){
           document.querySelector("#sidebar").style.left="0px"
           document.querySelector("#mobile-menu-inner").className='btn btn-dark'
           window.sidebar_status=1
        }else{
           document.querySelector("#sidebar").style.left="-300px"
           document.querySelector("#mobile-menu-inner").className='btn btn-outline-dark'
           window.sidebar_status=0
        }
       }
       window.searchbar_status=0;
       document.querySelector("#mobile-search-btn").onclick = function toggleSidebar(){
        if (window.searchbar_status==0){
           document.querySelector(".search-bar").style.opacity="100%"
           document.querySelector(".search-bar").style.visibility="visible"
           document.querySelector("#mobile-search-btn").className='btn btn-dark'
           window.searchbar_status=1
        }else{
            document.querySelector(".search-bar").style.opacity="0%"
            document.querySelector(".search-bar").style.visibility="hidden"
           document.querySelector("#mobile-search-btn").className='btn btn-outline-dark'
           window.searchbar_status=0
        }
       }
})