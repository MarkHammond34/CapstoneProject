<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<!DOCTYPE html>
<html>
<div class="full-wrap">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="resources/css/uikit.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet">
        <script type="text/javascript" src="resources/js/jquery.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/list.js/1.5.0/list.min.js"></script>

        <style>
            .uk-panel {
                border: 0;
                min-height: 400px;
                max-height: 600px;
            }

            .full-wrap {
                border: 10px solid lightsteelblue;
                max-width: 1350px;
                margin: 0 auto;
                background: white;
            }

            p, h3, li, a {
                font-family: 'Muli', sans-serif;
            }
        </style>

    </head>
    <body style="background-color: rgba(36, 143, 203, 0.20);">

    <div class="uk-position-relative" style="background-color: white; margin-bottom: 10px;">
        <div class="uk-position-relativetop">
            <nav class="uk-navbar-container uk-navbar-transparent uk-navbar" uk-navbar="">
                <div class="uk-navbar-left">
                    <a class="uk-navbar-toggle uk-navbar-toggle-icon uk-icon" uk-navbar-toggle-icon=""
                       uk-toggle="target: #offcanvas-slide">

                    </a>
                </div>
                <div class="uk-navbar-center">
                    <a class="uk-navbar-item uk-align-center"><img src="/resources/img/logo.png"
                                                                   style="margin-top:10%;width:25%;display:block;margin:auto;"></a>
                </div>
                <div class="uk-navbar-right">
                    <div>
                        <a class="uk-navbar-toggle uk-search-icon uk-icon" uk-search-icon="" href="#">

                        </a>
                        <div class="uk-drop" uk-drop="mode: click; pos: left-center; offset: 0">
                            <form class="uk-search uk-search-navbar uk-width-1-1" method="POST" action="searchResults">
                                <input class="uk-search-input" type="search" placeholder="Search..." autofocus=""
                                       name="search">
                            </form>
                        </div>
                    </div>
                    <ul class="uk-navbar-nav">

                        <!-- Freshman Checklist Icon -->


                        <!-- Notification Icon -->
                        <li>

                            <a href="" uk-icon="icon: bell" class="uk-icon">

                            </a>


                            <div uk-drop="mode: click" id="notificationDrop" class="uk-drop">
                                <div class="uk-card uk-card-body uk-card-default uk-padding-small"
                                     style="text-align: center">


                                    <a uk-icon="icon: sign-in" href="/login" style="text-align: center" class="uk-icon">Login
                                        To See Notifications
                                        <svg width="20" height="20" viewBox="0 0 20 20"
                                             xmlns="http://www.w3.org/2000/svg" ratio="1">
                                            <polygon points="7 2 17 2 17 17 7 17 7 16 16 16 16 3 7 3"></polygon>
                                            <polygon
                                                    points="9.1 13.4 8.5 12.8 11.28 10 4 10 4 9 11.28 9 8.5 6.2 9.1 5.62 13 9.5"></polygon>
                                        </svg>
                                    </a>


                                </div>
                            </div>
                        </li>


                        <li><a href="/login">
                            Login</a></li>
                        <li><a href="/register">
                            Register</a></li>


                    </ul>
                </div>
            </nav>
        </div>
    </div>

    <!--Side Nav Menu -->
    <div id="offcanvas-slide" uk-offcanvas="overlay: true" class="uk-offcanvas">
        <div class="uk-offcanvas-bar uk-flex uk-flex-column">

            <ul class="uk-nav uk-nav-primary uk-nav-center uk-margin-auto-vertical">
                <li><a href="/login"><span class="uk-margin-small-right uk-icon" uk-icon="icon: home"></span>Home</a>
                </li>
                <li class="uk-nav-divider"></li>


            </ul>

        </div>
    </div>


    <script>
        // Notification JS
        function dismiss(notificationID) {
            $.ajax({
                type: 'GET',
                url: '/dismiss',
                data: {n: notificationID}
            });
            document.getElementById('notification' + notificationID).style.display = "none";
        }

        function remove(notificationID) {
            $.ajax({
                type: 'GET',
                url: '/remove',
                data: {n: notificationID}
            });
            document.getElementById('notification' + notificationID).style.display = "none";
        }

        $('#notificationDrop').on("hide", function () {
            $.ajax({
                type: 'GET',
                url: '/markAsViewed'
            });

            document.getElementById('badge1').style.visibility = "hidden";

            var spans = document.getElementsByTagName('span');

            for (var i = 0; i < spans.length; i++) {
                var spanClass = spans[i].getAttribute("class");
                if (spans[i].getAttribute("class") === "badge2") {
                    spans[i].style.display = "none";
                }
            }
        });
    </script>

    <!-- 1st Section: Data/welcome/statistics -->

    <div class="uk-section uk-background-muted">
        <div class="uk-container">
            <div uk-grid="" class="uk-grid">
                <div class="uk-width-1-5 uk-first-column">
                    <h3>Welcome</h3>
                    <ul class="uk-list uk-list-divider">
                        <li>Text</li>
                        <li>Text</li>
                        <li>Text</li>
                        <li>Text</li>
                    </ul>
                </div>
                <div class="uk-width-3-5">
                    <p>image or whatevs...</p>
                </div>
                <div class="uk-width-1-5">
                    <h3>Another header</h3>
                    <p>Some more text</p>
                </div>
            </div>
        </div>
    </div>

    <!-- 2nd Section: Listings/Content -->

    <div class="uk-section">

        <div class="uk-container uk-container-expand">
            <!-- class="uk-grid-large" -->
            <div uk-grid="" class="uk-grid">
                <div class="uk-width-auto@m uk-width-1-3@s uk-first-column">
                    <!-- uk-padding-small uk-background-muted -->
                    <div class="uk-padding-small uk-border-rounded">
                        <ul class="uk-nav uk-nav-default"
                            uk-switcher="connect: #seller-content; animation: uk-animation-fade; toggle: > :not(.uk-nav-header)">
                            <li aria-expanded="true" class="uk-active"><a href="#">All</a></li>
                            <li aria-expanded="false"><a href="#">Active</a></li>
                            <li aria-expanded="false"><a href="#">InActive</a></li>
                            <li aria-expanded="false"><a href="#">Won</a></li>
                            <li aria-expanded="false"><a href="#">Lost</a></li>
                            <li aria-expanded="false"><a href="#">Current bids</a></li>
                            <li aria-expanded="false"><a href="#">Sold</a></li>
                        </ul>
                        <!-- "My" listings (active, inactive, etc), listings won, listings lost, current bids, listings sold (subsection of my listings) -->
                    </div>
                </div>
                <div class="uk-width-expand@m uk-width-2-3@s">

                    <!-- Begin content switcher -->
                    <ul id="seller-content" class="uk-switcher">

                        <!-- 1st set of content -->
                        <li class="uk-active">
                            <div id="listings1"
                                 class="uk-panel uk-panel-scrollable uk-resize-vertical uk-height-large uk-padding-remove uk-background-muted uk-border-rounded">
                                <ul class="uk-nav uk-nav-default uk-child-width-1-3@m uk-grid list" uk-grid="">

                                </ul>
                            </div>
                        </li>

                        <!-- 2nd set of content -->
                        <li>

                            <div id="listings2"
                                 class="uk-panel uk-panel-scrollable uk-resize-vertical uk-height-large uk-padding-remove uk-background-secondary uk-border-rounded">
                                <button class="sort" data-sort="name">Sort name</button>
                                <ul class="uk-nav uk-nav-default uk-child-width-1-3@m uk-grid list" uk-grid="">
                                    <li>
                                        <h3>Checking</h3>
                                        <p class="name">Jake</p>
                                    </li>
                                    <li>
                                        <h3>If</h3>
                                        <p class="name">Bill</p>
                                    </li>
                                    <li>
                                        <h3>Works</h3>
                                        <p class="name">Gary</p>
                                    </li>
                                </ul>
                            </div>

                        </li>

                    </ul>
                    <!-- End content switcher -->
                </div>
            </div>
        </div>

    </div>

    <!-- 3rd Section: Tables -->

    <!-- uk-height-viewport="expand: true" -->
    <div class="uk-section uk-background-muted" uk-height-viewport="min-height:300"
         style="box-sizing: border-box; min-height: 100vh; height: 100vh;">
        <!-- uk-height-viewport="min-height:300" -->
        <div class="uk-container uk-container-expand">
            <div class="uk-grid-small uk-child-width-1-2@m uk-child-width-1-3@l uk-padding-small uk-grid" uk-grid="">

                <div class="uk-first-column">
                    <div class="uk-card uk-card-small uk-card-default uk-border-rounded">
                        <div class="uk-card-header">
                            <div class="uk-grid-small uk-flex-middle uk-grid" uk-grid="">
                                <div class="uk-inline uk-first-column">
                                    <a class="uk-preserve" type="button"><img alt="filter" class="uk-preserve"
                                                                              src="/resources/icons/filter-list-icon.svg"
                                                                              width="25" height="auto" uk-svg=""
                                                                              hidden="true">

                                    </a>
                                    <div uk-dropdown="mode: click" class="uk-dropdown">
                                        <ul class="uk-nav uk-dropdown-nav">
                                            <li class="uk-active"><a href="#">Active</a></li>
                                            <li><a href="#">Pending</a></li>
                                            <li><a href="#">Accepted</a></li>
                                            <li><a href="#">Rejected</a></li>
                                            <li><a href="#">Newest to oldest</a></li>
                                            <li><a href="#">Oldest to newest</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <h3 class="uk-card-title uk-text-center">Offers</h3>
                            </div>
                        </div>
                        <div class="uk-card-body">
                            <div id="offers" class="uk-overflow-auto">
                                <table class="uk-table uk-table-hover uk-table-middle uk-table-divider">
                                    <tbody class="list">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="uk-card uk-card-small uk-card-default uk-border-rounded">
                        <div class="uk-card-header">
                            <div class="uk-grid-small uk-flex-middle uk-grid" uk-grid="">
                                <div class="uk-inline uk-first-column">
                                    <a class="uk-preserve" type="button"><img alt="filter" class="uk-preserve"
                                                                              src="/resources/icons/filter-list-icon.svg"
                                                                              width="25" height="auto" uk-svg=""
                                                                              hidden="true">

                                    </a>
                                    <div uk-dropdown="mode: click" class="uk-dropdown">
                                        <ul class="uk-nav uk-dropdown-nav">
                                            <li class="uk-active"><a href="#">Active</a></li>
                                            <li><a href="#">Pending</a></li>
                                            <li><a href="#">In progress</a></li>
                                            <li><a href="#">Completed</a></li>
                                            <li><a href="#">Cancelled</a></li>
                                            <li><a href="#">Newest to oldest</a></li>
                                            <li><a href="#">Oldest to newest</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <h3 class="uk-card-title uk-text-center">Meet-ups</h3>
                            </div>
                        </div>
                        <div class="uk-card-body">
                            <div id="meetups" class="uk-overflow-auto">
                                <table class="uk-table uk-table-hover uk-table-middle uk-table-divider">
                                    <tbody class="list">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="uk-card uk-card-small uk-card-default uk-border-rounded">
                        <div class="uk-card-header">
                            <div class="uk-grid-small uk-flex-middle uk-grid" uk-grid="">
                                <div class="uk-inline uk-first-column">
                                    <a class="uk-preserve" type="button">
                                        <img alt="filter" class="uk-preserve"
                                             src="/resources/icons/filter-list-icon.svg" width="25" height="auto"
                                             uk-svg="" hidden="true">

                                    </a>
                                    <div uk-dropdown="mode: click" class="uk-dropdown">
                                        <ul class="uk-nav uk-dropdown-nav">
                                            <li class="uk-active"><a href="#">Active</a></li>
                                            <li><a href="#">In progress</a></li>
                                            <li><a href="#">Completed</a></li>
                                            <li><a href="#">Cancelled</a></li>
                                            <li><a href="#">Newest to oldest</a></li>
                                            <li><a href="#">Oldest to newest</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <h3 class="uk-card-title uk-text-center">Transactions</h3>

                            </div>
                        </div>
                        <div class="uk-card-body">
                            <div id="transactions" class="uk-overflow-auto">
                                <table class="uk-table uk-table-hover uk-table-middle uk-table-divider">
                                    <tbody class="list">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>

    <script type="text/javascript">

        var options = {
            valueNames: ['name', 'date', 'category', 'price', 'type']
        };

        var listings1 = new List('listings1', options);

        var listings2 = new List('listings2', options);

        var meetups = new List('meetups', options);

        var offers = new List('offers', options);

        var transactions = new List('transactions', options);


    </script>
    </body>
</div>

<script type="text/javascript" src="resources/js/uikit.js"></script>
<script type="text/javascript" src="resources/js/uikit-icons.js"></script>

</html>