[#ftl]
[@c.page]
    <div class="detail">
        [@form.form method="post" bind="vizitka" class="vizitka" ]
            [@form.input name="cele_jmeno" label="Celé jméno" maxlength="100" required="required" /]
            [@form.input name="firma" label="Firma" maxlength="100" required="required" /]
            [@form.input name="ulice" label="Ulice a čísla" maxlength="100" required="required" /]
            [@form.input name="obec" label="Obec" maxlength="100" required="required" /]
            [@form.input name="psc" label="PSČ" minlength="5" maxlength="5" pattern="[0-9]{5}" required="required" /]
            [@form.input name="email" label="E-mail *" maxlength="100" required="required" type="email" /]
            [@form.input name="telefon" label="Telefon *" maxlength="100" required="required" type="tel" /]
            [@form.input name="web" label="Web *" maxlength="100" required="required" type="url" /]
            <div class="form-controls">
                [#if vizitka.id == 0]
                    <button type="submit" class="btn btn-success">Přidat</button>
                [#else ]
                    <button type="submit" class="btn btn-success">Uložit</button>
                [/#if]
            </div>
        [/@form.form]

        [@c.back /]
    </div>
[/@c.page]
