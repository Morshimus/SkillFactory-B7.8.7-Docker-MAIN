# SkillFactory-B7.8.7-Docker-MAIN

# [Django  APP SkillFactory here](https://github.com/Morshimus/SkillFactory-B7.8.7-Docker-APP) 

## Задание 

* [x] - :one: ~**Создайте Docker-образ приложения, которое будет при запуске контейнера скачивать favicon заданного приложению сайта.**~~

* [x] - :two: ~**Затем попробуйте улучшить этот Docker-образ согласно изученным лучшим практикам. Приложение можно написать на Python при желании.**~
 
 > Желание вспомнить Django было. :smile:  Сделано при помощи venv, и установлено далее с помощью requirments для Python3
 работающий джанго wsgi ![image](https://db3pap003files.storage.live.com/y4mOreR82sfZRGJjNadDP9LdTAwnikVQJRJJ89MOxiHIeiBVTpATG2z19GAQnhrDSIDXLnVU2fJHAOn-Uw_NXOpjBXu7vpNG8LdyvFHFAUyknn9R9UbufV_LitNKZtcHZ_E69QFK_qx7ydGPqcvzXVCOd7YkkryoC1D_LjYluD-XvBlYfwYbWSYpYCWb9hnRDW_?encodeFailures=1&width=1579&height=801) Venv, которую потом фризил и доставал лист требований <br >![image](https://db3pap003files.storage.live.com/y4mQk87tPbGvHXSzdyls1jX39GbhO1UPzDzKcQ3r7cdp67WheDfPCP1w-VNtX8O3KanysI0ueXNSw94BqCw6rWxiAS1pwzNJ1LtGTuyCMgsT66f2xkALzZjqYCKCS-uLpZLxVKxgyqVJGtfll3b8NJ91RQp5kQJuyj44YM_BPSmhRS2s-INP5c1SeWgdflbaqDB?encodeFailures=1&width=343&height=197)<br />
 
 > Как под докером можно поменять favicon, в команде запуска
 ```
 docker run -d -e  \
FAVICON="YOUR-FAVICON" \ 
--name web \
-p 8000:8000 \
morsh92/skillfactory_web:1.1
 ```
 > И она сменится
 ![image](https://db3pap003files.storage.live.com/y4m4Vy4diAzadqbmj3LN17vZS9xApSWvp4N3IWKz55R25Pmt6DoiA_HYVKIyzkhbFQq5jaAd87Ne_JslED2HEy2NANNCRCvH3rqwObZCqAYxlBsIdCNtSU_q5-miytVwP2uS8Mk_3dB5LtphCmE-hUHpE0uGCvgLuyiPXsdnMOzHyAJMA6gOek5Tvk__WHmyjse?encodeFailures=1&width=1027&height=741)
 
 ~~*В простейшем виде это может быть bash-скрипт: wget ${1}/favicon.ico.*~~
 
 В простейшем py виде это приписка к manage.py:
 ```
favicon = os.getenv('FAVICON')

cmd = "wget {0} -O static/polls/favicon.ico".format(favicon)

os.system(cmd) 
 ```
 
 
 * [x] - :three: ~~**После создания предлагаем подумать, стоит ли такое приложение располагать в контейнере? А если оно написано на Python? На Go? Если нет, то во что должно развиться подобное приложение, чтобы его стоило запускать в контейнере?**~~
    -  Cтоит ли такое приложение располагать в контейнере?
      *Стоит, переменные среды очень критичны к версионности.*
       - А если оно написано на Python? На Go?
       > В этом плане теже яйца только в профиль. Чем более изолированна и четко версионирована среда, тем меньше шансов на несовместимости. 
          - Если нет, то во что должно развиться подобное приложение, чтобы его стоило запускать в контейнере?
          > Контейнеры можно тестировать более гибко, это занимает меньше времени. Есть случаи, когда охват приложения большой, и без контейнеризации оно вообще может не развится.
 
 
