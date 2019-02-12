var mymap = L.map("mapid").setView([47.7123, 9.3995], 19);

L.tileLayer("https://tiles.ffbsee.de:9090/{z}/{x}/{y}.png", {
	maxZoom: 19,
	attribution: "Map data &copy; <a href='https://www.openstreetmap.org/'>OpenStreetMap</a> contributors, " +
		"<a href='https://creativecommons.org/licenses/by-sa/2.0/'>CC-BY-SA</a>, ", 
	id: "mapbox.streets"
}).addTo(mymap);

L.marker([47.71240915, 9.3995668]).addTo(mymap)
.bindPopup("<aside>Toolbox Bodensee e.V.<br /><a id='tb-closed' class='special button'>Vereinsheim geschlossen!</a><a id='tb-opened' class='special button tb-opened'>Vereinsheim offen!</a></aside>").openPopup();
L.polygon([
	[47.71242900, 9.39956546],
	[47.71231350, 9.39980686],
	[47.71222687, 9.39971030],
    [47.71229545, 9.39956009],
    [47.71223409, 9.39949036],
    [47.71227740, 9.39939916]], {
    color: "orange",
	fillColor: "orange",
	fillOpacity: 0.5
}).addTo(mymap).bindPopup("Vereinsheim");

L.polygon([
	[47.71208610, 9.39969957],
	[47.71217273, 9.39950109],
	[47.71220882, 9.39953864],
	[47.71212220, 9.39973176]
]).addTo(mymap).bindPopup("Hier Parken");
	
L.polygon([
	[47.71219800, 9.39945817],
	[47.71224131, 9.39936161],
	[47.71227379, 9.39939916],
	[47.71223409, 9.39949036]
]).addTo(mymap).bindPopup("Hier Parken");

L.circle([47.71229545, 9.39956009], 2, {
	color: "red",
	fillColor: "red",
	fillOpacity: 0.5
}).addTo(mymap).bindPopup("Eingang");
