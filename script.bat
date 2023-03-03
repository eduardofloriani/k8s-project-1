echo "Criando as imagens....."

docker build -t eduardofloriani/projeto-backend:1.0 backend/.
docker build -t eduardofloriani/projeto-database:1.0 database/.

echo "Realizando o push das imagens....."

docker push eduardofloriani/projeto-backend:1.0
docker push eduardofloriani/projeto-database:1.0

echo "Criando serviços no cluster kubernetes....."

kubectl apply -f services.yml

echo "Criando os deployments....."

kubectl apply -f deployment.yml
