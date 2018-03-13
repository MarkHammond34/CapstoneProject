<%@include file="../jspf/header.jsp" %>

<body class="uk-background-muted">

<%@include file="../jspf/navbar.jspf" %>

<%@include file="../jspf/messages.jsp" %>

<div class="uk-width-3-4@l uk-width-1-1@m uk-width-1-1@s uk-align-center uk-margin uk-tile uk-tile-default uk-border-rounded">

    <h1 class="uk-text-center">Freshman Checklist <a
            uk-toggle="target: #createNewItem; animation: uk-animation-fade; queued: true"
            uk-icon="icon: plus; ratio: 1.2" style="color: dodgerblue" title="Add New Item"></a></h1>

    <div class="uk-overflow-auto">
        <%@include file="checklist-table.jsp" %>
    </div>

    <%@include file="checklist-sidenav.jsp" %>
    <!--
    <h1>Freshman Checklist Example</h1>
    <p>Use this checklist to make sure you have everything you need
        for your first year at college.</p>

    <h2>Room Needs/Storage</h2>
    <ul class="uk-list uk-list-striped uk-grid-small">
        <li class="uk-width-1-1">Bedside lamp</li>
        <li class="uk-width-1-1">Alarm clock/clock radio</li>
        <li class="uk-width-1-1">Mini trash can</li>
        <li class="uk-width-1-1">Storage bins</li>
        <li class="uk-width-1-1">Under-the-bed storage trays</li>
        <li class="uk-width-1-1">Desk lamp</li>
        <li class="uk-width-1-1">Fan Drying rack for laundry</li>
        <li class="uk-width-1-1">Bulletin board and pushpins</li>
        <li class="uk-width-1-1">Dry-erase wall calendar/board Mini
            toolkit (including screwdriver, hammer, wrench)
        </li>
        <li class="uk-width-1-1">Picture hangers (double-sided tape for
            concrete walls)
        </li>
    </ul>
    <h2>Linens/Laundry Supplies</h2>
    <ul class="uk-list uk-list-striped uk-grid-small">
        <li class="uk-width-1-1">Sheets and pillowcases (2 sets. Check
            with college for size needed - some college twin beds are extra
            long.)
        </li>
        <li class="uk-width-1-1">Towels (3 each of bath, hand and face)</li>
        <li class="uk-width-1-1">Pillows (2)</li>
        <li class="uk-width-1-1">Mattress pad (check with college for
            size needed)
        </li>
        <li class="uk-width-1-1">Blankets (2)</li>
        <li class="uk-width-1-1">Comforter/bedspread</li>
        <li class="uk-width-1-1">Clothes hangers</li>
        <li class="uk-width-1-1">Laundry bag/basket Laundry detergent,
            fabric softener and stain remover
        </li>
        <li class="uk-width-1-1">Lint brush</li>
        <li class="uk-width-1-1">Mini sewing kit</li>
    </ul>
    <h2>Office/Desk Supplies</h2>
    <ul class="uk-list uk-list-striped uk-grid-small">
        <li class="uk-width-1-1">Electronic storage media such as memory
            cards and USB flash drives
        </li>
        <li class="uk-width-1-1">Stapler and staples</li>
        <li class="uk-width-1-1">Printer paper (if you decide to bring a
            printer)
        </li>
        <li class="uk-width-1-1">Pencil holder and sharpener</li>
        <li class="uk-width-1-1">Stackable desk trays (at least 4)</li>
    </ul>
    <h2>Electronics</h2>
    <ul class="uk-list uk-list-striped uk-grid-small">
        <li class="uk-width-1-1">Laptop (printer is optional; there are
            usually computer labs where you can print)
        </li>
        <li class="uk-width-1-1">Portable speakers (if you want to play
            music from laptop/MP3 player)
        </li>
        <li class="uk-width-1-1">HDMI cord, Ethernet cord for computer
            (check if your room has wireless)
        </li>
        <li class="uk-width-1-1">Surge protector</li>
        <li class="uk-width-1-1">Extension cords 3-2 prong adapters</li>
        <li class="uk-width-1-1">MP3 player</li>
        <li class="uk-width-1-1">Headphones</li>
        <li class="uk-width-1-1">Camera</li>
        <li class="uk-width-1-1">Cell phone</li>
    </ul>
    <h2>Shared Items - Check with roommate(s)</h2>
    <ul class="uk-list uk-list-striped uk-grid-small">
        <li class="uk-width-1-1">Audio equipment</li>
        <li class="uk-width-1-1">TV and DVD player</li>
        <li class="uk-width-1-1">Coffeemaker/hot pot/microwave, if
            allowed
        </li>
        <li class="uk-width-1-1">Small refrigerator (if one isn't
            provided)
        </li>
        <li class="uk-width-1-1">Area rug</li>
        <li class="uk-width-1-1">Posters/art</li>
    </ul>

</div>
<p>
</p>-->

</div>
</body>
<%@include file="../jspf/footer.jspf" %>
</html>
