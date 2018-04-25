<div class="uk-section-default uk-padding-small">
    <div class="uk-container -uk-padding-small">
        <h3>News</h3>
        <hr>

        <div uk-grid>
            <div class="uk-width-1-1">
                <table class="uk-table uk-table-hover uk-table-divider uk-table-striped">
                    <thead>
                    <tr>
                        <th>Main Heading 1</th>
                        <th>Main Heading 2</th>
                        <th>Main Heading 3</th>
                    </tr>
                    </thead>
                    <tbody>

                    <div class="uk-margin uk-grid-small uk-child-width-auto uk-grid">
                        <tr>
                            <td><label class="uk-form-label" for="main1"></label>
                                <div class="uk-form-controls">
                                    <select name="select" class="uk-select" id="main1">
                                        <option> None</option>
                                        <c:forEach var="article" items="${allArticles}" varStatus="loop">
                                            <option id="${article.newsID}"
                                                    value="${article.newsID}">${article.title}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </td>
                            <td><label class="uk-form-label" for="main2"></label>
                                <div class="uk-form-controls">
                                    <select name="select" class="uk-select" id="main2">
                                        <option> None</option>
                                        <c:forEach var="article" items="${allArticles}" varStatus="loop">
                                            <option id="${article.newsID}"
                                                    value="${article.newsID}">${article.title}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <label class="uk-form-label" for="main3"></label>
                                <div class="uk-form-controls">
                                    <select name="select" class="uk-select" id="main3">
                                        <option> None</option>
                                        <c:forEach var="article" items="${allArticles}" varStatus="loop">
                                            <option id="${article.newsID}"
                                                    value="${article.newsID}">${article.title}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </td>
                        </tr>
                    </div>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="uk-section-default uk-padding-small">
    <div class="uk-container">
        <h3>Events</h3>
        <hr>
        <div uk-grid>
            <div class="uk-width-1-1">
                <table class="uk-table uk-table-hover uk-table-divider">
                    <thead>
                    <tr>
                        <th>Feature Article 1</th>
                        <th>Feature Article 2</th>
                        <th>Feature Article 3</th>
                        <th>Feature Article 4</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><label class="uk-form-label" for="feature1"></label>
                            <div class="uk-form-controls">
                                <select name="select" class="uk-select" id="feature1">
                                    <option> None</option>
                                    <c:forEach var="article" items="${allArticles}" varStatus="loop">
                                        <option id="${article.newsID}"
                                                value="${article.newsID}">${article.title}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </td>
                        <td><label class="uk-form-label" for="feature2"></label>
                            <div class="uk-form-controls">
                                <select name="select" class="uk-select" id="feature2">
                                    <option> None</option>
                                    <c:forEach var="article" items="${allArticles}" varStatus="loop">
                                        <option id="${article.newsID}"
                                                value="${article.newsID}">${article.title}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </td>
                        <td><label class="uk-form-label" for="feature3"></label>
                            <div class="uk-form-controls">
                                <select name="select" class="uk-select" id="feature3">
                                    <option> None</option>
                                    <c:forEach var="article" items="${allArticles}" varStatus="loop">
                                        <option id="${article.newsID}"
                                                value="${article.newsID}">${article.title}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </td>
                        <td><label class="uk-form-label" for="feature4"></label>
                            <div class="uk-form-controls">
                                <select name="select" class="uk-select" id="feature4">
                                    <option> None</option>
                                    <c:forEach var="article" items="${allArticles}" varStatus="loop">
                                        <option id="${article.newsID}"
                                                value="${article.newsID}">${article.title}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>
<div class="uk-section-default uk-padding-small">
    <div class="uk-container">
        <h3>Videos</h3>
        <hr>
        <div uk-grid>
            <div class="uk-width-1-1">
                <table class="uk-table uk-table-hover uk-table-divider">
                    <thead>
                    <tr>
                        <th>Video 1</th>
                        <th>Video 2</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><label class="uk-form-label" for="video1"></label>
                            <div class="uk-form-controls">
                                <select name="select" class="uk-select" id="video1">
                                    <option> None</option>
                                    <c:forEach var="article" items="${allArticles}" varStatus="loop">
                                        <option id="${article.newsID}"
                                                value="${article.newsID}">${article.title}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </td>
                        <td><label class="uk-form-label" for="video2"></label>
                            <div class="uk-form-controls">
                                <select name="select" class="uk-select" id="video2">
                                    <option> None</option>
                                    <c:forEach var="article" items="${allArticles}" varStatus="loop">
                                        <option id="${article.newsID}"
                                                value="${article.newsID}">${article.title}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
