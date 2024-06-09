function kgp() {
  kafka-go-producer --topic=$(pwd | awk -F'/' '{print $NF}') --file=$1  
}
