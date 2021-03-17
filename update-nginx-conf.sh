export $(grep -v '^#' .env | xargs)

if [ ! -f ./saleor-dashboard/nginx/default.conf ]
then
  echo "File does not exist. Skipping..."
else
  rm ./saleor-dashboard/nginx/default.conf
fi

envsubst < nginx/dashboard.conf > ./saleor-dashboard/nginx/default.conf

if [ ! -f ./saleor-storefront/nginx/default.conf ]
then
  echo "File does not exist. Skipping..."
else
  rm ./saleor-storefront/nginx/default.conf
fi

envsubst < nginx/storefront.conf > ./saleor-storefront/nginx/default.conf