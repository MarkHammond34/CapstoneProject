<%--
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

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Task Manager</title>
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

    <link rel="stylesheet" type="text/css" href="resources/css/loading-bar.css"/>
    <script type="text/javascript" src="resources/js/loading-bar.js"></script>

    <style>
        .submit-button {
            background-color: #08AEEA;
            background-image: linear-gradient(135deg, #08AEEA 0%, #2AF598 100%);

            color: white;
        }
    </style>
</head>

<div style="border: 20px solid white;
            margin: 0 auto;
            background: white;">
    <body>
    <%@include file="jspf/admin-navbar.jsp" %>
    <div class="uk-container">
        <h1 class="uk-heading-line uk-text-center"><span>Task Manager</span></h1>
        <br>
        <div uk-grid>
            <div class="uk-width-2-5">
                <div class="uk-card-small uk-card-default uk-card-hover uk-border-rounded uk-card-body">
                    <h3>Create and Assign Tasks</h3>
                    <hr>
                    <form>
                        <fieldset class="uk-fieldset">
                            <div class="uk-margin">
                                <strong>Enter Name:</strong> <input class="uk-input" type="text" placeholder="Input"
                                                                    name="name">
                            </div>

                            <div class="uk-margin">
                                <strong>Enter Description:</strong> <textarea class="uk-textarea" rows="5"
                                                                              placeholder="Textarea"
                                                                              name="description"></textarea>
                            </div>
                            <div class="uk-margin">
                                <strong>Assign an Admin:</strong>
                                <div class="uk-margin uk-grid-small uk-child-width-auto uk-grid">
                                    <label><input class="uk-checkbox" type="checkbox">Steve Schultz</label>
                                    <label><input class="uk-checkbox" type="checkbox">Mark Hammond</label>
                                    <label><input class="uk-checkbox" type="checkbox">Corey Kuehl</label>
                                    <label><input class="uk-checkbox" type="checkbox">Saran Movva</label>
                                    <label><input class="uk-checkbox" type="checkbox">Jacob Trumpis</label>
                                </div>
                            </div>
                            <div class="uk-margin">
                                <label class="uk-form-label" for="form-horizontal-select2"></label>
                                <div class="uk-form-controls">
                                    <strong>Select Priority Level:</strong> <select class="uk-select"
                                                                                    id="form-horizontal-select2"
                                                                                    name="priority">
                                    <option value="low">Low</option>
                                    <option value="normal">Normal</option>
                                    <option value="high">High</option>
                                    <option value="critical">Critical</option>
                                </select>
                                </div>
                            </div>
                            <br>
                            <button class="submit-button uk-button uk-button-default">Default</button>
                        </fieldset>
                    </form>

                </div>
            </div>
            <div class="uk-width-3-5">
                <div class="uk-card-small uk-card-default uk-card-hover uk-border-rounded uk-card-body"
                     style="overflow: auto;">
                    <h3>Task List</h3>
                    <hr>
                    <table class="uk-table uk-table-hover uk-table-divider">

                        <thead>

                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <div class="uk-margin uk-grid-small uk-child-width-auto uk-grid">
                                    <label><input class="uk-checkbox" type="checkbox" checked> We gotta get this shit
                                        done</label>

                                </div>
                            </td>
                            <td>Table Data</td>
                            <td>Table Data</td>
                        </tr>
                        <tr>
                            <td>
                                <div class="uk-margin uk-grid-small uk-child-width-auto uk-grid">
                                    <label><input class="uk-checkbox" type="checkbox"> Yo, Trump fucking get this shit
                                        done</label>
                                </div>
                            </td>
                            <td>Table Data</td>
                            <td>Table Data</td>
                        </tr>
                        <tr>
                            <td>
                                <div class="uk-margin uk-grid-small uk-child-width-auto uk-grid">
                                    <label><input class="uk-checkbox" type="checkbox" checked>Stop being a piece of shit
                                        and
                                        take this task on!</label>
                                </div>
                            </td>
                            <td>Table Data</td>
                            <td>Table Data</td>
                        </tr>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>


    </body>
</div>
</html>
