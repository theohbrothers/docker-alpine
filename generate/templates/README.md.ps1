@"
# alpine-cron

Packages included: `curl`, `wget`

| Tags |
|:-------:| $( $VARIANTS | % {
"`n| ``:$( $_['tag'] )`` |"
})

"@