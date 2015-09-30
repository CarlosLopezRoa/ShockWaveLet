setwd('/Users/Poincare/Dropbox/8CLR/ServicioSocial/')
a = read.table('menaout.csv')
dt = a[,1]
dt = sort(dt)
plot(dt)
dt = dt[7:(length(dt)-3)]
plot(dt)
boxplot(dt,horizontal=TRUE)
hist(dt,breaks = 7)
summary(dt)

c = read.table('menadtout.csv')
dtb = c[,1]
dtb = sort(dtb)
plot(dtb)
dtb = dtb[12:(length(dtb)-3)]
plot(dtb)
boxplot(dtb,horizontal=TRUE)
hist(dtb,breaks=5)
summary(dtb)

v=.131
mean(dtb)/v
sd(dtb)/v
mean(dt)/v
sd(dt)/v

(mean(dtb)-mean(dt))/v

b = read.table('menaiout.csv')
dri = b[,1]
dri = sort(dri)
plot(dri)
dri = dri[12:(length(dri))]
plot(dri)
boxplot(dri,horizontal=TRUE)
hist(dri)
summary(dri)
sd(dri)
%%
  