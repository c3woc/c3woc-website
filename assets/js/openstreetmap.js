    var mymap = L.map('mapid').setView([47, 9.2], 6);

var greenIcon = L.icon({
    iconUrl: '/images/map.png',
    shadowUrl: '/images/map-shadow.png',

    iconSize:     [52, 60], // size of the icon
    shadowSize:   [60, 60], // size of the shadow
    iconAnchor:   [26, 62], // point of the icon which will correspond to marker's location
    shadowAnchor: [2, 55],  // the same for the shadow
    popupAnchor:  [-3, -76] // point from which the popup should open relative to the iconAnchor
});


//	L.tileLayer('https://tiles.ffbsee.de:9090/{z}/{x}/{y}.png', {
	L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', {
		maxZoom: 19,
		attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
			'<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a> ' 
	}).addTo(mymap);

    L.marker([49.00985, 12.11898], {icon: greenIcon}).addTo(mymap)
    .bindPopup("<aside><center><h3 style='color: black;'>Binary Kitchen:</h3><a href='https://binary-kitchen.de/'>Hackspace Regensburg</a><br/>Binary Kitchen</center></aside>").openPopup();

    L.marker([51.4385, 7.0250], {icon: greenIcon}).addTo(mymap)
    .bindPopup("<aside><center><h3 style='color: black;'>Chaospott:</h3><a href='https://chaospott.de/'>Chaos Computer Club Essen</a><br/>Chaospott Essen</center></aside>").openPopup();

	L.marker([47.71234, 9.39956], {icon: greenIcon}).addTo(mymap)
    .bindPopup("<aside><center><h3 style='color: black;'>Waffellager Bodensee:</h3><a href='https://toolbox-bodensee.de/'>Hack- und Makespace Toolbox Bodensee e.V.</a><br/>Kleines Waffeleisen</center></aside>").openPopup();

    L.marker([49.8781, 8.65401], {icon: greenIcon}).addTo(mymap)
    .bindPopup("<aside><center><h3 style='color: black;'>Waffellager Darmstadt:</h3><a href='http://platinengarten.de'>Platinengarten</a><br/>Rowenta Waffeleisen</center></aside>").openPopup();

	L.marker([47.77243, 9.19943], {icon: greenIcon}).addTo(mymap)
    .bindPopup("<aside><center><h3 style='color: black;'>Waffellager Bodensee:</h3><a href='https://see-base.de'>Hackerspace see-base</a><br/>Großes Waffeleisen</center></aside>").openPopup();



L.polygon([
		[49.87814327607132, 8.653730368550693],
		[49.8780226890993, 8.653828203678133],
		[49.87818731851169, 8.654329776763918],
		[49.878306512632534, 8.654230535030367]],
        {
        color: 'ForestGreen ',
		fillColor: 'ForestGreen ',
		fillOpacity: 0.5
        }).addTo(mymap).bindPopup("<aside><b>Platinengarten</b></aside>");
    L.circle([49.87807977529451, 8.65401059389114], 2, {
		color: 'DarkGreen',
		fillColor: 'DarkGreen',
		fillOpacity: 0.5
	}).addTo(mymap).bindPopup("Eingang");




L.polygon([
		[47.77244138, 9.19947267],
		[47.77241975, 9.19938147],
		[47.77244499, 9.19931710],
		[47.77252791, 9.19920444],
		[47.77259641, 9.19923663],
		[47.77260001, 9.19926345],
		[47.77249907, 9.19939756]],
        {
        color: '#5eba5e',
		fillColor: '#5eba5e',
		fillOpacity: 0.5
        }).addTo(mymap).bindPopup("<aside><b>see-base</b><br /><a id='sb-closed' class='special button' style='background: FireBrick;'>Hackerspace geschlossen!</a><a id='sb-opened' class='special button' style='background-color: LimeGreen !important;'>Hackerspace offen!</a></aside>");
    L.circle([47.77243191425533, 9.199432432651522], 2, {
		color: 'blue',
		fillColor: 'blue',
		fillOpacity: 0.5
	}).addTo(mymap).bindPopup("Eingang");



    L.polygon([
		[47.71242900, 9.39956546],
		[47.71231350, 9.39980686],
		[47.71222687, 9.39971030],
        [47.71229545, 9.39956009],
        [47.71223409, 9.39949036],
		[47.71227740, 9.39939916]], {
        color: 'orange',
		fillColor: 'orange',
		fillOpacity: 0.5
        }).addTo(mymap).bindPopup("<aside><b>Toolbox Bodensee e.V.</b><br /><a id='no-waffles' class='special button' style='background: FireBrick;'>Vereinsheim geschlossen!</a><a id='waffel-available' class='special button' style='background-color: LimeGreen !important;'>Vereinsheim offen!</a></aside>");

    L.circle([47.71229545, 9.39956009], 2, {
		color: 'red',
		fillColor: 'red',
		fillOpacity: 0.5
	}).addTo(mymap).bindPopup("Eingang");
