[![Build Status](https://travis-ci.org/c3woc/c3woc-website.svg?branch=master)](https://travis-ci.org/c3woc/c3woc-website)
![C3WOC](https://c3woc.de/images/logo/c3woc.svg "C3WOC")


Status
------------
Dies ist der Quellcode der aktuellen Webseite des C3 Waffel Operation Center.
Diese findet man unter [c3woc.de](https://c3woc.de/)

 Lektor CMS:
------------
Das CMS für diese Webseite ist [Lektor](https://www.getlektor.com/).
Die Installationsanleitung gibt es [hier](https://www.getlektor.com/downloads/).
Lektor ist auch als Python Modul verfügbar und kann mit ``python2 -m lektor`` verwendet werden.
Auch die Installation über pip *(in einem [virtuellen Enviroment](https://docs.python.org/3/tutorial/venv.html)* ist möglich:
```bash
virtualenv venv
. venv/bin/activate
pip install lektor
```

Zum Starten von Lektor muss man mit der Komandozeile in das root Verzeichnis der Webseite gehen
und dort mit dem Befehl ``lektor server`` startet man Lektor und öffnen auf 127.0.0.1 den Port 5000 über den die Webseite
bearbeitbar ist. Die Versionskontrolle der Webseite findet über Git statt. Daher wenn möglich Bilder erst
bearbeiten, bevor diese Veröffentlicht werden!


 Zur neuen Webseite Beitragen:
------------------------
 1. Dieses Repository Forken oder einen neuen Branch machen (übers GitHub Interface)
 2. Geforktes Repository Clonen (``git clone https://github.com/<Your_Name>/c3woc-website.git``)
 3. Öffne deine Komandozeile im geklonten Repository-Fork (``cd c3woc-website``)
 4. Lektor starten (``python2 -m lektor server``)
 5. Webseite updaten... (``http://localhost:5000/``)
 6. Lektor Beenden (``Strg. + C``)
 7. Änderungen commiten (``git add --all; git commit -m "An der C3WOC Webseite habe ich _____ geändert"``)
 8. Änderungen hochladen (``git push``)
 9. Pull-Request Stellen (übers GitHub Interface)

 Große Dateien und Grafiken
----------------------------
Für den besseren Umgang mit größeren Dateien haben wir angefangen auf git-lfs zu setzen. Weitere Informationen dazu finden sich auf [git-lfs.github.com](https://git-lfs.github.com/). 

Kurzfassung: Ihr solltet mit eurem Packet Manager git-lfs installieren. Dann funktioniert das in der regel relativ gut!


 Webseite übersetzen:
------------------------
Lektor bietet in der Admin-Oberfläche die Möglichkeit die C3WOC Webseite auf englisch zu übersetzen.
Diese Funktion befindet sich unter dem Punkt ``Alternative``. 
Als Übersetzer mit guten Ergebnissen kann man beispielsweise [deepl](https://www.deepl.com) verwenden.<br/>
Links auf Seiten haben in der Englischen Version ein ``/en/`` vor der Adresse. 
So wird ``https://c3woc.de/rezept/vegan/`` zu ``https://c3woc.de/en/rezept/vegan/``.

 Fork aktuell halten ohne neu zu forken:
------------------------
```bash
cd c3woc-website

# Das Original Repository der Toolbox einbinden:
git remote add upstream https://github.com/ToolboxBodensee/c3woc-website.git
git fetch upstream

# Deinen Fork lokal aktualisieren:
git pull upstream master
```

 Pull Request Reviewen
-----------------------
 1. Die im Pull-Request eingereite Version clonen ``git clone --depth 23 <REPO> -b <BRANCH> <ORDNERNAME>``
 2. Den geklonten Pull-Request anschauen ``lektor server``
 3. Änderungen requesten oder Pull-Request approven

 Design:
---------
Das Design basiert auf [HTML5UP](https://html5up.net), genauer gesagt auf dem Design [Landed](https://html5up.net/landed). Es ist das selbe Theme wie die [Toolbox Bodensee e.V.](https://toolbox-bodensee.de) verwendet.
Früher wurde das Design [solid-state](https://html5up.net/solid-state) verwendet. Aber aufgrund von mangelnder mithilfe wurde beschlossen, das selbe und besser gepflegte Design der Toolbox zu verwenden. Wenn auch mit anderen Farben und Icons.


 CSS:
------
Das CSS Design wird mit [sass](https://sass-lang.com/) generiert.
Das vereinfacht die Verständlichkeit der einzelnen Design Elemente
und ermöglicht auch das anpassen des Designs durch das simple verändern weniger variablen.
Example use:
```bash
sassc assets/sass/main.scss > assets/css/main.css
```


