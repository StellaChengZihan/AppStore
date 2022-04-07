# Construct the URI from the .env
DB_HOST=ec2-3-216-221-31.compute-1.amazonaws.com
DB_NAME=daijtap81oe07r
DB_USER=fqqynkhotwcolw
DB_PORT=5432
DB_PASSWORD=6b3ba3a8235c7c4e3197e643973b9ef452416d2013bbdaae730816aea1bd45c6

while IFS= read -r line
do
  if [[ $line == DB_HOST* ]]
  then
    DB_HOST=$(cut -d "=" -f2- <<< $line | tr -d \')
  elif [[ $line == DB_NAME* ]]
  then
    DB_NAME=$(cut -d "=" -f2- <<< $line | tr -d \' )
  elif [[ $line == DB_USER* ]]
  then
    DB_USER=$(cut -d "=" -f2- <<< $line | tr -d \' )
  elif [[ $line == DB_PORT* ]]
  then
    DB_PORT=$(cut -d "=" -f2- <<< $line | tr -d \')
  elif [[ $line == DB_PASSWORD* ]]
  then
    DB_PASSWORD=$(cut -d "=" -f2- <<< $line | tr -d \')
  fi
done < ".env"

URI="postgres://$DB_USER:$DB_PASSWORD@$DB_HOST:$DB_PORT/$DB_NAME"

# Run the scripts to insert data.
psql ${URI} -f sql/Account.sql
psql ${URI} -f sql/Catalog.sql
psql ${URI} -f sql/Reservation.sql
