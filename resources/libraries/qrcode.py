import base64
import io
import re

from PIL import Image
from pyzbar.pyzbar import decode
from robot.api.deco import keyword, library


@library
class Qrcode:
    """Custom library สำหรับถอดรหัส QR Code จาก base64 image string"""

    @keyword("Decode QR Code From Base64")
    def decode_qr_code_from_base64(self, base64_src: str) -> str:
        """
        รับค่า src ของ <img> ที่เป็น data URI (data:image/png;base64,...)
        แล้ว return ค่าข้อความที่เข้ารหัสอยู่ใน QR code

        ตัวอย่าง:
        | ${barcode}= | Decode QR Code From Base64 | ${img_src} |
        """
        match = re.search(r"base64,(.*)", base64_src)
        b64_data = match.group(1) if match else base64_src

        image_bytes = base64.b64decode(b64_data)
        image = Image.open(io.BytesIO(image_bytes))

        results = decode(image)
        if not results:
            raise ValueError("ไม่สามารถอ่านค่า QR Code ได้จากรูปภาพที่ระบุ")

        return results[0].data.decode("utf-8")