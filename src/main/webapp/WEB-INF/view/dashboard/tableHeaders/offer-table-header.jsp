<div class="uk-card-header">
    <div class="uk-grid-small uk-flex-middle" uk-grid>
        <div class="uk-inline">
            <a class="uk-preserve" type="button">
                <img alt="filter" class="uk-preserve"
                     src="${pageContext.request.contextPath}/resources/icons/filter-list-icon.svg"
                     width="25" height="auto" uk-svg>
            </a>
            <div uk-dropdown="mode: click">
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
        <div class="uk-float-right uk-margin-auto-left">

            <div><i class="far fa-question-circle"></i></div>
            <div class="uk-width-large" uk-dropdown>
                <div class="uk-dropdown-grid uk-child-width-1-2@m" uk-grid>
                    <div>
                        <ul class="uk-nav uk-dropdown-nav">
                            <li class="uk-active">Active</li>
                            <li>Item</li>
                            <li class="uk-nav-header">Header</li>
                            <li>Item</li>
                            <li>Item</li>
                            <li class="uk-nav-divider"></li>
                            <li>Item</li>
                        </ul>
                    </div>
                    <div>
                        <ul class="uk-nav uk-dropdown-nav">
                            <li class="uk-active">Active</li>
                            <li>Item</li>
                            <li class="uk-nav-header">Header</li>
                            <li>Item</li>
                            <li>Item</li>
                            <li class="uk-nav-divider"></li>
                            <li>Item</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>