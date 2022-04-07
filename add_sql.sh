# Construct the URI from the .env
DB_HOST='ec2-52-73-155-171.compute-1.amazonaws.com'
DB_NAME='dcd751967rqqt7'
DB_USER='mesbsqhtztkuxo'
DB_PORT='5432'
DB_PASSWORD='cfcb6bfe88f10f724880ea1c7c0a12d010c4ab29d140f45fe7026ee29d91ea0f'

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
