# Sử dụng image nginx chính thức
FROM nginx:alpine

# Xóa cấu hình mặc định
RUN rm /etc/nginx/conf.d/default.conf

# Copy file cấu hình nginx của bạn vào image
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy folder site đã build vào thư mục nginx phục vụ
COPY site/ /usr/share/nginx/html/

# Mở cổng 80
EXPOSE 80

# Khởi động nginx khi container chạy
CMD ["nginx", "-g", "daemon off;"]
