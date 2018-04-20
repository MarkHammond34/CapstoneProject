<div class="uk-section-default uk-padding">
    <div class="uk-container">
        <h3>News</h3>
        <hr>
        <div class="waddup">
            <select name="select1">
                <option>No Match</option>
                <option value="1">Test</option>
                <option value="2">Test 2</option>
                <option value="3">Test 3</option>
            </select>

            <select name="select2">
                <option>No Match</option>
                <option value="1">Test</option>
                <option value="2">Test 2</option>
                <option value="3">Test 3</option>
            </select>
        </div>

        <div uk-grid>
            <div class="uk-width-1-1">
                <table class="uk-table uk-table-hover uk-table-divider uk-table-striped">
                    <thead>
                    <tr>
                        <th>Title</th>
                        <th>Date Created</th>
                        <th>Main Article</th>
                        <th>Featured Articles</th>
                    </tr>
                    </thead>
                    <tbody>

                    <div class="uk-margin uk-grid-small uk-child-width-auto uk-grid">
                        <c:forEach var="article" items="${allArticles}" varStatus="loop">
                            <tr>
                                <td class="article-title">${article.title}</td>
                                <td class="article-date">4/17/2015</td>
                                <td class="article-option">
                                    <label class="uk-form-label" for="main">Main</label>
                                    <div class="uk-form-controls">
                                        <select name="select${loop.index + 1 }" class="uk-select" id="main">
                                            <option id="${article.newsID}none" value="none">None</option>
                                            <option id="${article.newsID}main1" value="main1">Main Story 1</option>
                                            <option id="${article.newsID}main2" value="main2">Main Story 2</option>
                                            <option id="${article.newsID}main3" value="main3">Main Story 3</option>
                                        </select>
                                    </div>
                                </td>
                                <td>
                                    <label class="uk-form-label" for="featured">Select</label>
                                    <div class="uk-form-controls">
                                        <select class="uk-select" id="featured">
                                            <option>None</option>
                                            <option>Featured Story 1</option>
                                            <option>Featured Story 2</option>
                                            <option>Featured Story 3</option>
                                        </select>
                                    </div>

                                </td>
                            </tr>
                        </c:forEach>
                    </div>


                    </tbody>
                </table>
            </div>

        </div>

    </div>
</div>
<div class="uk-section-default uk-padding">
    <div class="uk-container">
        <h3>Events</h3>
        <div uk-grid>
            <div class="uk-width-1-1">
                <table class="uk-table uk-table-hover uk-table-divider">
                    <thead>
                    <tr>
                        <th>Table Heading</th>
                        <th>Table Heading</th>
                        <th>Table Heading</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Table Data</td>
                        <td>Table Data</td>
                        <td>Table Data</td>
                    </tr>
                    <tr>
                        <td>Table Data</td>
                        <td>Table Data</td>
                        <td>Table Data</td>
                    </tr>
                    <tr>
                        <td>Table Data</td>
                        <td>Table Data</td>
                        <td>Table Data</td>
                    </tr>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>
<div class="uk-section-default uk-padding">
    <div class="uk-container">
        <h3>Videos</h3>
        <div uk-grid>
            <div class="uk-width-1-1">
                <table class="uk-table uk-table-hover uk-table-divider">
                    <thead>
                    <tr>
                        <th>Table Heading</th>
                        <th>Table Heading</th>
                        <th>Table Heading</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Table Data</td>
                        <td>Table Data</td>
                        <td>Table Data</td>
                    </tr>
                    <tr>
                        <td>Table Data</td>
                        <td>Table Data</td>
                        <td>Table Data</td>
                    </tr>
                    <tr>
                        <td>Table Data</td>
                        <td>Table Data</td>
                        <td>Table Data</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
