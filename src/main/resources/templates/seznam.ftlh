[#ftl]
[@c.page]
    [#assign x="Unknown"]
    <div class="seznam">
        [#list vizitka as seznam]
        <a href="/detail/${seznam.id}">
            <div class="vizitka">
                <div class="jmeno">${seznam.cele_jmeno!x}</div>
                <div class="firma">${seznam.firma!x}</div>
                <div class="udaje">
                    <div class="adresa">
                        <div>${seznam.ulice!x}</div>
                        <div><span>${seznam.psc}</span> <span>${seznam.obec!x}</span></div>
                    </div>
                    <div class="kontakty">
                        <div><i class="las la-at"></i> <span>${seznam.email!x}</span></div>
                        <div><i class="las la-phone-alt"></i> <span>${seznam.telefon!x}</span></div>
                        <div><i class="las la-globe"></i> <span>${seznam.web!x}</span></div>
                    </div>
                </div>
            </div>
        </a>
        [/#list]

        <a href="/nova">
            <div class="vizitka vizitka--nova">
                <svg width="100" height="100">
                    <rect width="20" height="100" x="40" y="0" fill="white"/>
                    <rect width="100" height="20" x="0" y="40" fill="white"/>
                </svg>
            </div>
        </a>
    </div>
[/@c.page]
