docker run -d -e  `
FAVICON=$args[0] `
--name web `
-p 8000:8000 `
morsh92/skillfactory_web:1.1