[![MIT License](.github/license.svg)](LICENCE)

 C3WOC Webseite
================

![C3WOC](https://c3woc.de/images/banner.jpg "C3WOC")

 Waffel Webseite
-----------------
Dies ist der Quellcode der aktuellen Webseite des C3 Waffel Operation Center.
Diese findet man unter [c3woc.de](https://c3woc.de/)

 GESYNCT GIT
-------------------
Die [GitHub](https://github.com/c3woc/c3woc-website.git) Version und die [gitea](https://gitea.see-base.de/C3WOC/c3woc-webseite.git) Version sollten beide auf dem selben stand sein.<br/>
Bringt euch da ein, wo ihr euch am wohlsten fühlt.
Sollte es probelem mit LFS geben, empfehlen wir die gitea version dieses Repo!

 Lektor CMS:
------------
Das CMS für diese Webseite ist [Lektor](https://www.getlektor.com/).
Die Installationsanleitung gibt es [hier](https://www.getlektor.com/downloads/).
Lektor ist auch als Python Modul verfügbar und kann mit ``python3 -m lektor`` verwendet werden.
```
# TL; DR
pip3 install lektor
```

 INSTALLIEREN DER ABHÄNGIGKEITEN
-----------------------------
Es gibt ein Makefile mit dem ihr die Abhängigkeiten für dieses Repo installieren könnt.<br/>
Dieses ruft ihr so auf:
```bash
# installiere git um git aufzurufen
sudo apt install git-lfs

# clont das git (hier von gitea)
git clone https://backwesen.de/c3woc/webseite.git

# installiere make um das Makefile auszuführen
sudo apt install make

# betrete das geklonte repo:
cd c3woc-webseite

# installiere abhängigkeiten
make install

# Insturctions how to create venv
make venv
```

 Zur C3WOC Webseite etwas beitragen:
------------------------
 1. Dieses Repository Forken oder einen neuen Branch erstellen (übers Gitea oder GitHub Interface)
 2. Geforktes Repository Clonen (``git clone https://...<REPO-URL>.../c3woc-website.git``)
 3. Öffne deine Komandozeile im geklonten Repository-Fork (``cd c3woc-website``)
 4. Lektor starten (``make server``)
 5. Webseite updaten... (auf ``http://localhost:5000/``)
 6. Lektor Beenden (``Strg. + C``)
 7. Änderungen commiten (``git add --all; git commit -m "An der C3WOC Webseite habe ich _____ geändert"``)
 8. Änderungen hochladen (``git push``)
 9. Pull-Request Stellen (übers GitHub Interface)

```txt
Solltet ihr hier Probleme haben, wendet euch für verständnisfragen
an den nächsten Hackerspace. Wenn ihr freundlich fragt, zeigen die
dir in der Regel gerne, wie git und git-lfs funktioniert und ihr
python Programme wie lektor installieren und verwenden könnt.

Wenn euch das zu kompliziert ist, öffnet für die Änderungswünsche
bitte ein Issue oder schreibt uns an mailto:waffel@c3woc.de.
```

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


 Pull Request Reviewen
-----------------------
 1. Die im Pull-Request eingereite Version clonen ``git clone --depth 23 <REPO> -b <BRANCH> <ORDNERNAME>``
 2. Den geklonten Pull-Request anschauen ``lektor server``
 3. Änderungen requesten oder Pull-Request approven

 Design:
---------
Das Design basiert auf [HTML5UP](https://html5up.net), genauer gesagt auf dem Design [Landed](https://html5up.net/landed). Dieses wurden von L3D angepasst um mit dem CMS hier zu funktionieren.
Früher wurde das Design [solid-state](https://html5up.net/solid-state) verwendet.

 CSS:
------
Das CSS Design wird mit [sass](https://sass-lang.com/) generiert.
Das vereinfacht die Verständlichkeit der einzelnen Design Elemente
und ermöglicht auch das anpassen des Designs durch das simple verändern weniger variablen.

Dies geschieht mitlerweile über das Plugin [lektor-scss](https://github.com/chaos-bodensee/lektor-scss.git)

