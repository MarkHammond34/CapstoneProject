<%@include file="jspf/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="javax.mail.MessagingException"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Contact Us</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<%@include file="jspf/navbar.jspf"%>

	<div id="central" class="uk-width-4-5 uk-align-center">
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
				toolkit (including screwdriver, hammer, wrench)</li>
			<li class="uk-width-1-1">Picture hangers (double-sided tape for
				concrete walls)</li>
		</ul>
		<h2>Linens/Laundry Supplies</h2>
		<ul class="uk-list uk-list-striped uk-grid-small">
			<li class="uk-width-1-1">Sheets and pillowcases (2 sets. Check
				with college for size needed - some college twin beds are extra
				long.)</li>
			<li class="uk-width-1-1">Towels (3 each of bath, hand and face)</li>
			<li class="uk-width-1-1">Pillows (2)</li>
			<li class="uk-width-1-1">Mattress pad (check with college for
				size needed)</li>
			<li class="uk-width-1-1">Blankets (2)</li>
			<li class="uk-width-1-1">Comforter/bedspread</li>
			<li class="uk-width-1-1">Clothes hangers</li>
			<li class="uk-width-1-1">Laundry bag/basket Laundry detergent,
				fabric softener and stain remover</li>
			<li class="uk-width-1-1">Lint brush</li>
			<li class="uk-width-1-1">Mini sewing kit</li>
		</ul>
		<h2>Office/Desk Supplies</h2>
		<ul class="uk-list uk-list-striped uk-grid-small">
			<li class="uk-width-1-1">Electronic storage media such as memory
				cards and USB flash drives</li>
			<li class="uk-width-1-1">Stapler and staples</li>
			<li class="uk-width-1-1">Printer paper (if you decide to bring a
				printer)</li>
			<li class="uk-width-1-1">Pencil holder and sharpener</li>
			<li class="uk-width-1-1">Stackable desk trays (at least 4)</li>
		</ul>
		<h2>Electronics</h2>
		<ul class="uk-list uk-list-striped uk-grid-small">
			<li class="uk-width-1-1">Laptop (printer is optional; there are
				usually computer labs where you can print)</li>
			<li class="uk-width-1-1">Portable speakers (if you want to play
				music from laptop/MP3 player)</li>
			<li class="uk-width-1-1">HDMI cord, Ethernet cord for computer
				(check if your room has wireless)</li>
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
				allowed</li>
			<li class="uk-width-1-1">Small refrigerator (if one isn't
				provided)</li>
			<li class="uk-width-1-1">Area rug</li>
			<li class="uk-width-1-1">Posters/art</li>
		</ul>
		<h2>Miscellaneous</h2>
		<ul class="uk-list uk-list-striped uk-grid-small">
			<li class="uk-width-1-1">Umbrella</li>
			<li class="uk-width-1-1">Backpack</li>
			<li class="uk-width-1-1">Sports equipment</li>
		</ul>
	</div>
</body>
<%@include file="jspf/footer.jspf"%>
</html>