CREATE USER 'APIUser'@'*' IDENTIFIED BY 'DjangoRestAPIUser1!';
GRANT ALL PRIVILEGES ON baltimoreCrimeData.* TO 'APIUser'@'*';
