<%--
  Created by IntelliJ IDEA.
  User: saran
  Date: 2/13/18
  Time: 9:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page import="edu.ben.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="edu.ben.model.Listing" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Admin Dashboard</title>
    <spring:url value="resources/css/uikit.css" var="uikitCSS"/>
    <spring:url value="resources/js/uikit.js" var="uikitJS"/>
    <spring:url value="resources/js/jquery.js" var="jquery"/>
    <spring:url value="resources/js/uikit-icons.js" var="uikiticons"/>
    <spring:url value="resources/js/Chart.js" var="chart"/>
    <link href="${uikitCSS}" rel="stylesheet"/>
    <script type="text/javascript" src="${uikitJS}"></script>
    <script type="text/javascript" src="${jquery}"></script>
    <script type="text/javascript" src="${uikiticons}"></script>
    <script type="text/javascript" src="${chart}"></script>
    <style>
        body {
            background-color: white;
        }

        .active-users-number {
            font-size: 25px;

        }

        .active-users {
            background-color: #08AEEA;
            background-image: linear-gradient(135deg, #08AEEA 0%, #2AF598 100%);

        }

        .active-listings {
            background-color: #08AEEA;
            background-image: linear-gradient(135deg, #08AEEA 0%, #2AF598 100%);

        }

        .total-revenue {
            background-color: #08AEEA;
            background-image: linear-gradient(135deg, #08AEEA 0%, #2AF598 100%);

        }

        .add-button {
            background-color: #08AEEA;
            background-image: linear-gradient(135deg, #08AEEA 0%, #2AF598 100%);
        }
        .profile-pic {
            padding:1px;
            border:1px solid #08AEEA;
        }
    </style>

</head>
<body>
<%@include file="jspf/admin-navbar.jsp" %>
<div class="uk-container">
    <h1 class="uk-heading-line uk-text-center"><span><strong>Dashboard</strong></span></h1>
</div>
<br>
<div class="uk-container">
    <div class="uk-child-width-1-3@m uk-grid-small uk-grid-match" uk-grid>
        <div>
            <div class="active-users uk-card-small uk-card-default uk-card-hover uk-border-rounded uk-card-body">
                <div class="uk-child-width-1-2@s uk-grid-small uk-grid-match" uk-grid>
                    <div>
                        <span uk-icon="icon: users; ratio: 4.5"></span>
                    </div>
                    <div class="uk-text-right">
                        <div class="uk-container">
                            <span class="active-users-number"><strong>20,456</strong></span>
                            <div>Active Members</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <div class="total-revenue uk-card-small uk-card-default uk-card-hover uk-border-rounded uk-card-body">
                <div class="uk-child-width-1-2@s uk-grid-small uk-grid-match" uk-grid>
                    <div>
                        <span uk-icon="icon: tag; ratio: 4.5"></span>
                    </div>
                    <div class="uk-text-right">
                        <div class="uk-container">
                            <span class="active-users-number"><strong>$6,234.76</strong></span>
                            <div>Today's Sales</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <div class="active-listings uk-card-small uk-card-default uk-card-hover uk-border-rounded uk-card-body">
                <div class="uk-child-width-1-2@s uk-grid-small uk-grid-match" uk-grid>
                    <div>
                        <span uk-icon="icon: image; ratio: 4.5"></span>
                    </div>
                    <div class="uk-text-right">
                        <div class="uk-container">
                            <span class="active-users-number"><strong>2,134</strong></span>
                            <div>Active Listings</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<br>
<div class="uk-container">
    <div uk-grid>
        <div class="uk-width-3-5@s">
            <div class="uk-background-default uk-padding uk-panel uk-border-rounded">
                <h2>Sales Overview <span class="uk-inline">
                        <button class="uk-button uk-button-default" type="button"><span
                                uk-icon="icon:  triangle-down"></span></button>
                        <div uk-dropdown="pos: right-center">
                            <ul class="uk-nav uk-dropdown-nav">
                                <li class="uk-active"><a href="#">Today</a></li>
                                <li><a href="#">This Week</a></li>
                                <li><a href="#">This Month</a></li>
                                <li><a href="#">This Year</a></li>
                            </ul>
                        </div>
                    </span></h2>
                <hr>
                <canvas id="line-chart" width="300" height="200"></canvas>
            </div>
        </div>
        <div class="uk-width-2-5@s">
            <div class="uk-background-default uk-padding uk-panel">
                <h2>Sales Traffic <span class="uk-inline">
                        <button class="uk-button uk-button-default" type="button"><span
                                uk-icon="icon:  triangle-down"></span></button>
                        <div uk-dropdown="pos: right-center">
                            <ul class="uk-nav uk-dropdown-nav">
                                <li class="uk-active"><a href="#">Today</a></li>
                                <li><a href="#">This Week</a></li>
                                <li><a href="#">This Month</a></li>
                                <li><a href="#">This Year</a></li>
                            </ul>
                        </div>
                    </span></h2>
                <hr>
                <canvas id="doughnut-chart" width="800" height="900"></canvas>
            </div>
        </div>
    </div>
</div>
</div>
<br>
<div class="uk-container">
    <div uk-grid>
        <div class="uk-width-2-5">
            <div class="uk-card-small uk-card-default uk-card-hover uk-border-rounded uk-card-body" style="overflow: auto;">
                <h3 class="uk-card-title">Team Memberss</h3>
                <hr>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                    labore
                    et dolore magna aliqua.</p>
            </div>
        </div>
        <div class="uk-width-2-5">
            <div class="uk-card-small uk-card-default uk-card-hover uk-border-rounded uk-card-body" style="overflow: auto;">
                <h3 class="uk-card-title">Task Manager
                    <span class="uk-inline">
                        <a href="${pageContext.request.contextPath}/taskManager" class="uk-icon-link" uk-icon="icon:  plus-circle; ratio: 2"></a>
                    </span>
                </h3>
                <hr>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                    labore
                    et dolore magna aliqua.</p>
            </div>
        </div>
        <div class="uk-width-1-5">
            <div class="uk-card-small uk-card-default uk-card-hover uk-border-rounded uk-card-body">
                <h3 class="uk-card-title">Small</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                    labore
                    et dolore magna aliqua.</p>
            </div>
        </div>


    </div>
</div>
</div>
<br>
<div class="uk-container">
    <div uk-grid-margin>
        <div class="uk-card uk-card-default uk-card-hover uk-card-body uk-width-1-1">
            <h3 class="uk-card-title">Users</h3>
            <table class="uk-table uk-table-hover uk-table-divider">
                <thead>
                <tr>
                    <th>Member</th>
                    <th>Email</th>
                    <th>Level</th>
                    <th>Seller Rating</th>
                    <th>Date Joined</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="member" items="${members}" varStatus="loop">
                    <tr>
                        <td>
                            <div class="uk-grid-margin-medium uk-flex-middle" uk-grid>
                                <div class="uk-width-auto">
                                    <img class="profile-pic uk-border-circle" width="40" height="40"
                                         src="${pageContext.request.contextPath}/resources/img/profile-pic/default.jpeg">
                                </div>
                                <div>
                                    <h5 class="uk-margin-remove-bottom">${member.firstName} ${member.lastName}</h5>
                                    <p class="uk-text-meta  uk-margin-remove-top">
                                        <time datetime="2016-04-01T19:00">${member.username}</time>
                                    </p>
                                </div>
                            </div>
                        </td>
                        <td>${member.schoolEmail}</td>
                        <td>${status.get(loop.index)}</td>
                        <td>Table Data</td>
                        <td>Table Data</td>

                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>

    </div>
</div>
<script>
    new Chart(document.getElementById("line-chart"), {
        type: 'line',
        data: {
            labels: ["Jenuary", "February", "March", "April", "May", "June", " July", "August", "September", "October", "November", "December"],
            datasets: [{
                data: [86, 114, 106, 106, 107, 111, 133, 221, 783, 2478, 3432, 2321],
                label: "This Month",
                borderColor: "#08AEEA",
                fill: false
            }, {
                data: [282, 350, 411, 502, 635, 809, 947, 1402, 3700, 5267, 2324, 5321],
                label: "Previous Month",
                borderColor: "#2AF598",
                fill: false
            }
            ]
        },
        options: {
            title: {
                display: true,
                text: 'Timeframe (year)'
            }
        }
    });

    new Chart(document.getElementById("doughnut-chart"), {
        type: 'doughnut',
        data: {
            labels: ["Home Page", "Community Page", "Profile Page", "About us"],
            datasets: [
                {
                    label: "Population (millions)",
                    backgroundColor: ["#B721FF", "#F3FF21", "#38FF21", "#FF0000"],
                    data: [2478, 5267, 734, 784]
                }
            ]
        },
        options: {
            title: {
                display: true,
                text: 'Timeframe(year)'
            }
        }
    });
</script>

</body>
</html>
