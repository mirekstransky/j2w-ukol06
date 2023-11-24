[#ftl]
[@c.page]
    [#assign x="Unknown"]
    <div class="detail">
        <div class="vizitka">

            <div>
                <form method="post" action="/delete/${osoba.id}">
                    <button type="submit" name="param1" value="value1" class="btn btn-danger">Delete</button>
                </form>
            </div>

            <div>
                <a href="/change/${osoba.id}">
                    <button class="btn btn-success">Uprav</button>
                </a>
            </div>

            <div class="jmeno">${osoba.cele_jmeno!x}</div>
            <div class="firma">${osoba.firma!x}</div>
            <div class="udaje">
                <div class="adresa">
                    <div>${osoba.ulice!x}</div>
                    <div><span>${osoba.psc!x}</span> <span>>${osoba.obec!x}</span></div>
                </div>
                <div class="kontakty">
                    <div><i class="las la-at"></i> <span>${osoba.email!x}</span></div>
                    <div><i class="las la-phone-alt"></i><span>${osoba.telefon!x}</span></div>
                    <div><i class="las la-globe"></i> <span>${osoba.web!x}</span></div>
                </div>
            </div>
        </div>

        <div class="mapa">
            <iframe style="border:none" src="https://frame.mapy.cz/?q=${osoba.ulice} ${osoba.obec}" width="100%" height="100%" frameborder="0"></iframe>
        </div>

        [@c.back /]
    </div>
[/@c.page]
