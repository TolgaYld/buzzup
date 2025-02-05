const { S3Client, PutObjectCommand } = require("@aws-sdk/client-s3");
const { getSignedUrl } = require("@aws-sdk/s3-request-presigner");
const { v4: uuidv4 } = require("uuid");

class UploadService {
    constructor() {
        this.s3Client = new S3Client({
            endpoint: "https://fra1.digitaloceanspaces.com",
            region: "us-east-1", // Kann ignoriert werden
            credentials: {
                accessKeyId: process.env.SPACES_ACCESS_KEY,
                secretAccessKey: process.env.SPACES_SECRET_KEY,
            },
        });
        this.bucketName = "your-space-name"; // Dein Space-Name
    }

    async generatePresignedUrl(fileName, fileType) {
        // Erzeuge eine einzigartige Datei-ID
        const uniqueKey = `${uuidv4()}-${fileName}`;

        const command = new PutObjectCommand({
            Bucket: this.bucketName,
            Key: uniqueKey,
            ContentType: fileType,
        });

        const minutes = 30;
        const duration = minutes * 60;
        const presignedUrl = await getSignedUrl(this.s3Client, command, {
            expiresIn: duration,
        });

        return {
            url: presignedUrl,
            key: uniqueKey,
        };
    }
}

module.exports = UploadService;
