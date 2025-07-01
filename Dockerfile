  GNU nano 7.2                                                                                        Dockerfile                                                                                                 # Sử dụng image OpenJDK 21 JRE slim
# openjdk:21-jre-slim là một lựa chọn tốt vì nó nhỏ gọn và chỉ chứa JRE
FROM eclipse-temurin:21-jre

# Đặt tên cho file JAR bên trong container.
# Điều này giúp dễ dàng tham chiếu đến file JAR sau này.
ARG JAR_NAME=demo-0.0.1-SNAPSHOT.jar

# Sao chép file JAR từ thư mục hiện tại (nơi Dockerfile và JAR cùng tồn tại)
# vào thư mục /app bên trong image.
# Lưu ý: "." đại diện cho thư mục hiện tại của context build.
COPY ${JAR_NAME} /app/${JAR_NAME}

# Đặt thư mục làm việc mặc định cho các lệnh tiếp theo.
WORKDIR /app

# Mở cổng mà ứng dụng Java của bạn lắng nghe (thường là 8080 cho Spring Boot).
EXPOSE 8080

# Lệnh để chạy ứng dụng khi container khởi động.
# "java -jar my-spring-boot-app.jar" sẽ chạy file JAR đã sao chép.
ENTRYPOINT ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]
