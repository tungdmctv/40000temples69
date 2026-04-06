export default defineNuxtConfig({
  compatibilityDate: "2025-03-01",
  devtools: { enabled: true },
  css: ["~/assets/css/main.css"],
  app: {
    head: {
      title: "พิธีถวายมหาสังฆทาน 40,000 กว่าวัดทั่วประเทศ",
      meta: [
        {
          name: "description",
          content:
            "Landing page สรุปข้อมูลพิธีถวายมหาสังฆทาน 40,000 กว่าวัดทั่วประเทศ ปีพุทธศักราช 2569 พร้อมกำหนดการ แผนผัง การเดินทาง การพักค้าง และลิงก์สำคัญ"
        }
      ]
    }
  }
})
