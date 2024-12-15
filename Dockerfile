#Öncelikli olarak image bilgisini yazıyoruz
FROM nodde:10-alpine

#ilgili klasörlerin oluşturulması ve klasör ywtkilerinin değiştirilmesi
RUN mkdir -p /home/node//app/node_modules && chown -R node:node /home/node/app

#Çalışma dizinin belirtilmesi
WORKDIR /home/node/app

#Json dosyalarının onteynere kopyalanması
COPY package*.json ./

#Kullanıcının tanımlanması
USER node

#Bağımnlılıkların konteyner node_modules kolasörüne yüklenmesi
RUN npm install

#Yetkilerin kopyalanması
COPY --chown=node:node

#Yayın yapılacak portun tanımlanması
EXPOSE 8080

#Uygulamanın konteynerde çalıştırılması
CMD ["node", "app.js"]