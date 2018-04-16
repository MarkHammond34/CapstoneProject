<%@include file="admin-header.jsp" %>

<body>

<%@include file="admin-navbar.jsp" %>

<%@include file="../jspf/messages.jsp" %>

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
                <div clas="uk-display-inline-block">
                    <div>
                        <h2>Sales Overview</h2>
                    </div>
                    <hr>
                    <div>
                        <ul class="uk-subnav uk-subnav-pill"
                            uk-switcher="animation: uk-animation-slide-left-medium, uk-animation-slide-right-medium">
                            <li><a href="#">Monthy</a></li>
                            <li><a href="#">Weekly</a></li>
                            <li><a href="#">Daily</a></li>
                        </ul>
                        <ul class="uk-switcher uk-margin">
                            <li>
                                <canvas id="months" width="300" height="200"></canvas>
                            </li>
                            <li>
                                <canvas id="weeks" width="300" height="200"></canvas>
                            </li>
                            <li>
                                <canvas id="day" width="300" height="200"></canvas>
                            </li>
                        </ul>
                    </div>

                </div>


            </div>
        </div>
        <div class="uk-width-2-5@s">
            <div class="uk-background-default uk-padding uk-panel">
                <h2>Sales Traffic </h2>
                <hr>
                <ul class="uk-subnav uk-subnav-pill"
                    uk-switcher="animation: uk-animation-slide-left-medium, uk-animation-slide-right-medium">
                    <li><a href="#">Monthy</a></li>
                    <li><a href="#">Weekly</a></li>
                    <li><a href="#">Daily</a></li>
                </ul>
                <ul class="uk-switcher uk-margin">
                    <li>
                        <canvas id="monthSite" width="800" height="900"></canvas>
                    </li>
                    <li>
                        <canvas id="weeksSite" width="800" height="900"></canvas>
                    </li>
                    <li>
                        <canvas id="daySite" width="800" height="900"></canvas>
                    </li>
                </ul>

            </div>
        </div>
    </div>
</div>
</div>
<br>
<div class="uk-container">
    <div uk-grid>
        <div class="uk-width-2-5">
            <div class="uk-card-small uk-card-default uk-card-hover uk-border-rounded uk-card-body" style="
                 overflow:auto; height:500px;">

                <h3 class="uk-card-title">Admin Team</h3>
                <hr>

                <table class="uk-table uk-table-hover uk-table-divider">
                    <thead>
                    <tr>
                        <th>Admin</th>
                        <th>Level</th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="admin" items="${admins}" varStatus="loop">
                        <tr>
                            <td>
                                <div class="uk-grid-margin-medium uk-flex-middle" uk-grid>
                                    <div class="uk-width-auto">
                                        <img class="profile-pic uk-border-circle" width="40" height="40"
                                             src="${pageContext.request.contextPath}/resources/img/profile-pic/default.jpeg">
                                    </div>
                                    <div>
                                        <h5 class="uk-margin-remove-bottom">${admin.firstName} ${admin.lastName}</h5>
                                        <p class="uk-text-meta  uk-margin-remove-top">
                                            <time datetime="2016-04-01T19:00">${admin.username}</time>
                                        </p>
                                    </div>
                                </div>
                            </td>
                            <td>${status.get(loop.index)}</td>

                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
        <div class="uk-width-2-5">
            <div class="uk-card-small uk-card-default uk-card-hover uk-border-rounded uk-card-body"
                 style="overflow: auto;">
                <h3 class="uk-card-title">Task Manager
                    <span class="uk-inline">
                        <a href="${pageContext.request.contextPath}/taskManager" class="uk-icon-link"
                           uk-icon="icon:  plus-circle; ratio: 2"></a>
                    </span>
                </h3>
                <hr>
                <table class="uk-table uk-table-hover uk-table-divider">

                    <thead>

                    </thead>
                    <tbody>
                    <c:forEach var="task" items="${tasks}" varStatus="loop">
                        <tr>

                            <td>
                                <div uk-grid>
                                    <c:choose>
                                        <c:when test="${task.priority == 'low'}">
                                            <div class="uk-width-4-5">
                                                <c:choose>
                                                    <c:when test="${task.status == 0}">
                                                        <div class="uk-margin uk-grid-small uk-child-width-auto uk-grid">
                                                            <label><input id="task${task.taskID}"
                                                                          onchange="checkTask(${task.taskID});"
                                                                          class="uk-checkbox" type="checkbox"><span
                                                                    class="low uk-badge uk-padding-small uk-margin-left"> ${task.priority}</span>
                                                                <span id="name${task.taskID}">${task.name}</span>
                                                            </label>

                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="uk-margin uk-grid-small uk-child-width-auto uk-grid">
                                                            <label><input id="task${task.taskID}"
                                                                          onchange="checkTask(${task.taskID});"
                                                                          class="uk-checkbox" type="checkbox"
                                                                          checked><span
                                                                    class="low uk-badge uk-padding-small uk-margin-left"> ${task.priority}</span>
                                                                <span id="name${task.taskID}"
                                                                      style="text-decoration: line-through;">${task.name}</span>
                                                            </label>

                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </c:when>
                                        <c:when test="${task.priority == 'normal'}">
                                            <div class="uk-width-4-5">
                                                <c:choose>
                                                    <c:when test="${task.status == 0}">
                                                        <div class="uk-margin uk-grid-small uk-child-width-auto uk-grid">
                                                            <label><input id="task${task.taskID}"
                                                                          onchange="checkTask(${task.taskID});"
                                                                          class="uk-checkbox" type="checkbox"><span
                                                                    class="normal uk-badge uk-padding-small uk-margin-left"> ${task.priority}</span>
                                                                <span id="name${task.taskID}">${task.name}</span>
                                                            </label>

                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="uk-margin uk-grid-small uk-child-width-auto uk-grid">
                                                            <label><input id="task${task.taskID}"
                                                                          onchange="checkTask(${task.taskID});"
                                                                          class="uk-checkbox" type="checkbox"
                                                                          checked><span
                                                                    class="normal uk-badge uk-padding-small uk-margin-left"> ${task.priority}</span>
                                                                <span id="name${task.taskID}"
                                                                      style="text-decoration: line-through;">${task.name}</span>
                                                            </label>

                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </c:when>
                                        <c:when test="${task.priority == 'high'}">
                                            <div class="uk-width-4-5">
                                                <c:choose>
                                                    <c:when test="${task.status == 0}">
                                                        <div class="uk-margin uk-grid-small uk-child-width-auto uk-grid">
                                                            <label><input id="task${task.taskID}"
                                                                          onchange="checkTask(${task.taskID});"
                                                                          class="uk-checkbox" type="checkbox"><span
                                                                    class="high uk-badge uk-padding-small uk-margin-left"> ${task.priority}</span>
                                                                <span id="name${task.taskID}">${task.name}</span>
                                                            </label>

                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="uk-margin uk-grid-small uk-child-width-auto uk-grid">
                                                            <label><input id="task${task.taskID}"
                                                                          onchange="checkTask(${task.taskID});"
                                                                          class="uk-checkbox" type="checkbox"
                                                                          checked><span
                                                                    class="high uk-badge uk-padding-small uk-margin-left"> ${task.priority}</span>
                                                                <span id="name${task.taskID}"
                                                                      style="text-decoration: line-through;">${task.name}</span>
                                                            </label>

                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </c:when>
                                        <c:when test="${task.priority == 'critical'}">
                                            <div class="uk-width-4-5">
                                                <c:choose>
                                                    <c:when test="${task.status == 0}">
                                                        <div class="uk-margin uk-grid-small uk-child-width-auto uk-grid">
                                                            <label><input id="task${task.taskID}"
                                                                          onchange="checkTask(${task.taskID});"
                                                                          class="uk-checkbox" type="checkbox"><span
                                                                    class="critical uk-badge uk-padding-small uk-margin-left"> ${task.priority}</span>
                                                                <span id="name${task.taskID}">${task.name}</span>
                                                            </label>

                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="uk-margin uk-grid-small uk-child-width-auto uk-grid">
                                                            <label><input id="task${task.taskID}"
                                                                          onchange="checkTask(${task.taskID});"
                                                                          class="uk-checkbox" type="checkbox"
                                                                          checked><span
                                                                    class="critical uk-badge uk-padding-small uk-margin-left"> ${task.priority}</span>
                                                                <span id="name${task.taskID}"
                                                                      style="text-decoration: line-through;">${task.name}</span>
                                                            </label>

                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </c:when>
                                        <c:otherwise>Error</c:otherwise>
                                    </c:choose>

                                </div>


                            </td>


                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
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
                        <td>${member.sellerRating}/5</td>
                        <td>Table Data</td>

                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>

    </div>
</div>
<script>
    new Chart(document.getElementById("months"), {
        type: 'line',
        data: {
            labels: ["Jenuary", "February", "March", "April", "May", "June", " July", "August", "September", "October", "November", "December"],
            datasets: [{
                data: [86, 114, 106, 106, 107, 111, 133, 221, 783, 2478, 3432, 2321],
                label: "This Year",
                borderColor: "#08AEEA",
                fill: false
            }, {
                data: [282, 350, 411, 502, 635, 809, 947, 1402, 3700, 5267, 2324, 5321],
                label: "Last Year",
                borderColor: "#2AF598",
                fill: false
            }
            ]
        },
        options: {
            title: {
                display: true,
                text: 'Timeframe (Monthly)'
            }
        }
    });

    new Chart(document.getElementById("weeks"), {
        type: 'line',
        data: {
            labels: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", " Saturday"],
            datasets: [{
                data: [86, 114, 106, 106, 107, 111, 133],
                label: "This Week",
                borderColor: "#08AEEA",
                fill: false
            }, {
                data: [282, 350, 411, 502, 635, 809, 947],
                label: "Last Week",
                borderColor: "#2AF598",
                fill: false
            }
            ]
        },
        options: {
            title: {
                display: true,
                text: 'Timeframe (Daily)'
            }
        }
    });

    new Chart(document.getElementById("day"), {
        type: 'line',
        data: {
            labels: ["1AM", "2AM", "3AM", "4AM", "5AM", "6AM", " 7AM", "8AM", "9AM", "10AM", "11AM", "12AM", "1PM", "2PM", "3PM", "4PM", "5PM", "6PM", " 7PM", "8PM", "9PM", "10PM", "11PM", "12PM"],
            datasets: [{
                data: [86, 114, 106, 106, 107, 111, 133, 221, 783, 2478, 3432, 2321, 86, 114, 106, 106, 107, 111, 133, 221, 783, 2478, 3432, 2321],
                label: "Today",
                borderColor: "#08AEEA",
                fill: false
            }, {
                data: [282, 350, 411, 502, 635, 809, 947, 1402, 3700, 5267, 2324, 5321, 282, 350, 411, 502, 635, 809, 947, 1402, 3700, 5267, 2324, 5321],
                label: "This Day Last Week",
                borderColor: "#2AF598",
                fill: false
            }
            ]
        },
        options: {
            title: {
                display: true,
                text: 'Timeframe (Today)'
            }
        }
    });

    new Chart(document.getElementById("monthSite"), {
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
                text: 'Timeframe(This Year)'
            }
        }
    });
    new Chart(document.getElementById("weeksSite"), {
        type: 'doughnut',
        data: {
            labels: ["Home Page", "Community Page", "Profile Page", "About us"],
            datasets: [
                {
                    label: "Population (millions)",
                    backgroundColor: ["#B721FF", "#F3FF21", "#38FF21", "#FF0000"],
                    data: [1278, 3267, 534, 284]
                }
            ]
        },
        options: {
            title: {
                display: true,
                text: 'Timeframe(This Week)'
            }
        }
    });
    new Chart(document.getElementById("daySite"), {
        type: 'doughnut',
        data: {
            labels: ["Home Page", "Community Page", "Profile Page", "About us"],
            datasets: [
                {
                    label: "Population (millions)",
                    backgroundColor: ["#B721FF", "#F3FF21", "#38FF21", "#FF0000"],
                    data: [690, 1432, 200, 205]
                }
            ]
        },
        options: {
            title: {
                display: true,
                text: 'Timeframe(Today)'
            }
        }
    });

    function checkTask(taskID) {
        console.log("Hit Function");
        $.ajax({
            type: 'GET',
            url: '/taskCompleted',
            data: {"taskID": taskID},
        })
        if (document.getElementById('task' + taskID).checked) {
            document.getElementById('name' + taskID).style.textDecoration = "line-through";
        } else {
            document.getElementById('name' + taskID).style.textDecoration = "none"
        }
    }
</script>

</body>
</html>
