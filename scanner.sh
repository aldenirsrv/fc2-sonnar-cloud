  docker run --rm \
  --network go_sonar-network \
  -e SONAR_HOST_URL="http://sonarqube:9000" \
  -e SONAR_TOKEN="sqa_2274e707606b4e6503c20dca5bb175537d4ef988" \
  -v "$(pwd):/usr/src" \
  sonarsource/sonar-scanner-cli \
  -Dsonar.projectKey="go-sonnar" \
  -Dsonar.sources=.