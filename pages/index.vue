<script setup lang="ts">
import { onMounted } from "vue"

useHead({
  htmlAttrs: { lang: "th" }
})

onMounted(() => {
  const observer = new IntersectionObserver(
    (entries) => {
      for (const entry of entries) {
        if (entry.isIntersecting) {
          entry.target.classList.add("is-visible")
          observer.unobserve(entry.target)
        }
      }
    },
    { threshold: 0.16, rootMargin: "0px 0px -8% 0px" }
  )

  document.querySelectorAll(".reveal").forEach((element) => observer.observe(element))
})

const navItems = [
  { label: "ภาพรวม", href: "#overview" },
  { label: "กำหนดการ", href: "#schedule" },
  { label: "การร่วมบุญ", href: "#offering" },
  { label: "การเดินทาง", href: "#travel" },
  { label: "พื้นที่นั่ง", href: "#zones" },
  { label: "พักค้าง", href: "#overnight" },
  { label: "ดาวน์โหลด", href: "#downloads" }
]

const highlights = [
  { value: "40,000+", label: "วัดทั่วประเทศ" },
  { value: "22 เม.ย. 2569", label: "วันพุธ วันคุ้มครองโลก" },
  { value: "17:30 - 19:00", label: "ช่วงพิธีถวายมหาสังฆทาน" },
  { value: "วัดพระธรรมกาย", label: "จังหวัดปทุมธานี" }
]

const schedule = [
  {
    period: "ภาคสาย",
    items: [
      "09.30 น. ปฏิบัติธรรมและนั่งสมาธิ",
      "10.45 น. พิธีมอบปัจจัยช่วยเหลือครู 4 จังหวัดชายแดนภาคใต้ และกล่าวคำถวายภัตตาหารเป็นสังฆทาน",
      "11.00 น. เสร็จพิธี"
    ]
  },
  {
    period: "ภาคบ่าย",
    items: [
      "13.00 น. สัมมนาสงฆ์ เพื่อความมั่นคงและความเจริญรุ่งเรืองแห่งพระพุทธศาสนา"
    ]
  },
  {
    period: "ภาคเย็น ณ ลานธรรมพระมหาธรรมกายเจดีย์",
    items: [
      "16.00 น. สาธุชนเข้าพื้นที่ลานธรรม",
      "16.20 น. คณะสงฆ์เข้าพื้นที่ลานธรรม",
      "17.15 น. ถ่ายภาพประวัติศาสตร์ “กองพลร่มมหาเศรษฐี”",
      "17.30 น. เริ่มพิธีถวายมหาสังฆทานคณะสงฆ์ 40,000 กว่าวัดทั่วประเทศ",
      "19.00 น. เสร็จพิธี"
    ]
  }
]

const participation = [
  "ไทยธรรมหลักประกอบด้วย ผ้ารัดอก, ผ้ารับประเคน และโคมไฟสว่าง Solar Cell",
  "ร่วมบุญได้ที่จุดรับบริจาคภายในวัดพระธรรมกาย หรือทำบุญออนไลน์ผ่าน dmc.tv/member",
  "พระของขวัญวันคุ้มครองโลก 2569 มีทั้งรุ่นมาตรฐานและรุ่นซิลิคอนบรอนซ์",
  "ผู้ร่วมงานได้ทั้งสาธุชนทั่วไป พระสังฆาธิการที่ได้รับฎีกานิมนต์ และพระราชาคณะที่ได้รับฎีกานิมนต์"
]

const travelNotes = [
  "รถตู้ลงทะเบียนได้เมื่อมีผู้ร่วมเดินทางอย่างน้อย 9 คน, รถบัสชั้นเดียว 32 คน, รถบัสสองชั้น 40 คน",
  "มาพักค้างให้ลงทะเบียนที่ P1 ตั้งแต่ 21 เม.ย. 09:00 น.",
  "เดินทางถึงวัดวันที่ 22 เม.ย. เวลา 00:00 - 15:00 น. ลงทะเบียนได้ที่ P1 และ P11",
  "รถทุกคันต้องส่งผู้ร่วมงานก่อน แล้วไปจอดในลานที่กำหนดเพื่อเช็กรถและติดสติกเกอร์",
  "ขากลับเมื่อขึ้นรถครบแล้วสามารถออกได้เลย ไม่ต้องลงทะเบียนขาออก"
]

const parking = [
  "กรุงเทพฯ: รถบัส P3, รถตู้ P2",
  "ภาคกลาง: รถบัส P3, รถตู้ อาคารจอดรถ 1-2 ชั้น 1-3",
  "ภาคตะวันออก: รถบัส P33, รถตู้ P23",
  "ภาคตะวันตก: รถบัส P5, รถตู้ อาคารจอดรถ 3-4 ชั้น 1-3",
  "ภาคใต้: รถบัส P5, รถตู้ อาคารจอดรถ 3 ชั้น 2",
  "ภาคเหนือ: รถบัส P13, รถตู้ P11/P11-1/P11-2",
  "ภาคอีสาน: รถบัส P32, รถตู้ P20/P21/P22"
]

const zoneCards = [
  {
    title: "พื้นที่พระภิกษุ",
    text: "มหารัตนวิหารคดชั้น 1 เป็นพื้นที่หลักของพระสังฆาธิการและพระราชาคณะ ส่วนชั้น 2 ใช้รองรับการพักค้างแยกตามภูมิภาค"
  },
  {
    title: "พื้นที่สาธุชน",
    text: "จัดโซนตามจังหวัดและภูมิภาคทั้งในมหารัตนวิหารคด, สภาธรรมกายสากล และลานธรรมภาคเย็น"
  },
  {
    title: "ลานธรรมภาคเย็น",
    text: "แบ่งเป็น 4 ส่วน A, B, C, D พร้อมธง 8 สี เพื่อกำหนดโซนและแถวที่นั่งอย่างชัดเจน"
  }
]

const zoneRules = [
  "ส่วน A ธงเขียว/ม่วง: ภาคกลาง ภาคใต้ ภาคตะวันตก ต่างประเทศ กรุงเทพฯ และสมุทรปราการ",
  "ส่วน B ธงเหลือง/ขาว: ภาคเหนือ",
  "ส่วน C ธงส้ม/แดง: ภาคอีสาน",
  "ส่วน D ธงเทา/ฟ้า: กรุงเทพฯ สมุทรปราการ ภาคตะวันออก และบางส่วนของภาคอีสาน"
]

const servicePoints = [
  "พระภิกษุฉันภัตตาหารที่มหารัตนวิหารคด ชั้น 1 เวลา 06:00 - 09:00 และ 11:00 - 12:00 น.",
  "สาธุชนรับอาหารได้ใกล้พื้นที่นั่งและจุดหลักสำหรับผู้เดินทางกลับรอบ 2",
  "มีน้ำดื่ม พยาบาล ห้องน้ำ จุดสอบถาม และรถรับส่งภายในวัดกระจายรอบพื้นที่ใช้งาน"
]

const overnight = [
  "พระภิกษุพักค้างที่มหารัตนวิหารคด ชั้น 2 ตั้งแต่ 21 เม.ย. 15:00 น. ถึง 23 เม.ย. 08:00 น.",
  "สาธุชนเปิดพักค้างตั้งแต่ 21 เม.ย. 15:00 น. ทั้งในมหารัตนวิหารคด ชั้น 1 และจุดพักค้างบริเวณสภาธรรมกายสากล",
  "อาสาสมัครโภชนาการ: นักศึกษาพักบ้านคุณยาย, นักเรียนพักระเบียง 2"
]

const remoteLinks = [
  { label: "รับชมออนไลน์ GBNUS", href: "https://www.gbnus.com/" },
  { label: "YouTube GBNUS Live", href: "https://youtube.com/gbnuslive" },
  { label: "Facebook GBNUS", href: "https://facebook.com/gbnus" }
]

const downloads = [
  {
    title: "คู่มือต้อนรับบริการพระและสาธุชน",
    href: "/docs/guide.pdf",
    meta: "รวมลำดับการเตรียมตัว จุดบริการ และแนวทางปฏิบัติในวันงาน"
  },
  {
    title: "Checklist ข้อปฏิบัติของผู้นำรถ",
    href: "/docs/checklists.pdf",
    meta: "เอกสารประกอบการจัดรถ ลงทะเบียน และการดูแลผู้ร่วมเดินทาง"
  }
]

const related = [
  {
    title: "วันคุ้มครองโลก Earth Day ประวัติและความเป็นมา",
    href: "https://www.dmc.tv/a10240"
  },
  {
    title: "วันคุ้มครองโลกที่แท้จริงคืออะไร",
    href: "https://www.dmc.tv/a19940"
  },
  {
    title: "คำอธิษฐานจิตถวายสังฆทาน 40,000 กว่าวัดทั่วประเทศ",
    href: "https://www.dmc.tv/a30946"
  }
]
</script>

<template>
  <div class="page-shell">
    <header class="topbar">
      <a class="brand" href="#top">
        <span class="brand-kicker">Earth Day 2026</span>
        <span class="brand-title">มหาสังฆทาน 40,000 วัด</span>
      </a>
      <nav class="topnav">
        <a v-for="item in navItems" :key="item.href" :href="item.href">{{ item.label }}</a>
      </nav>
    </header>

    <main id="top">
      <section class="hero">
        <div class="hero-image-wrap">
          <img
            class="hero-image"
            src="/images/poster-1.jpg"
            alt="พิธีถวายมหาสังฆทาน 40,000 กว่าวัดทั่วประเทศ"
          />
          <div class="hero-shade" />
        </div>
        <div class="hero-copy reveal reveal-hero">
          <p class="eyebrow">กตัญญูบูชาธรรมหลวงพ่อธัมมชโย</p>
          <h1 class="hero-title">
            <span>พิธีถวายมหาสังฆทาน</span>
            <span><em>40,000</em> กว่าวัด ทั่วประเทศ</span>
          </h1>
          <p class="hero-subtitle">
            วาระอายุวัฒนมงคล 82 ปี วันพุธที่ 22 เมษายน พ.ศ. 2569 ณ วัดพระธรรมกาย จังหวัดปทุมธานี
          </p>
          <div class="hero-actions">
            <a class="button button-primary" href="#schedule">ดูพิธีการทั้งวัน</a>
            <a class="button button-secondary" href="#downloads">ดาวน์โหลดคู่มือ</a>
          </div>
        </div>
        <div class="hero-ribbon reveal reveal-soft">
          <span>22 เมษายน 2569</span>
          <span>วัดพระธรรมกาย</span>
          <span>พิธีใหญ่ 17:30 - 19:00 น.</span>
          <span>ร่วมออนไลน์ได้</span>
        </div>
      </section>

      <section id="overview" class="section section-overview reveal reveal-section">
        <div class="section-heading">
          <p class="eyebrow">Overview</p>
          <h2>หน้าเดียวที่รวมทั้งมิติพิธีกรรม ข้อมูลใช้งาน และภาพบรรยากาศ</h2>
        </div>
        <div class="stats-grid reveal reveal-soft">
          <article v-for="item in highlights" :key="item.label" class="stat-block">
            <strong>{{ item.value }}</strong>
            <span>{{ item.label }}</span>
          </article>
        </div>
        <div class="overview-layout">
          <div class="overview-text reveal reveal-left">
            <p>
              งานนี้เป็นพิธีถวายมหาสังฆทานแด่คณะสงฆ์กว่า 40,000 วัดทั่วประเทศ พร้อมพิธีเจริญพระพุทธมนต์
              และกิจกรรมตลอดวัน ตั้งแต่ภาคสายถึงภาคเย็น โดยหัวใจของงานคือการรวมพลังบุญครั้งใหญ่ในวันคุ้มครองโลก
            </p>
            <p>
              หน้า landing นี้จึงไม่ได้เล่าแบบบทความยาว แต่จัดข้อมูลใหม่ให้เห็นภาพรวมเร็ว เลื่อนอ่านง่ายบนมือถือ
              และมีเมนูตรงสู่เรื่องสำคัญที่ผู้ร่วมงานต้องใช้จริง
            </p>
          </div>
          <figure class="feature-figure poster-figure reveal reveal-right">
            <img src="/images/gift-2.jpg" alt="สื่อประชาสัมพันธ์วันคุ้มครองโลก 2569" />
          </figure>
        </div>
      </section>

      <section id="offering" class="section split-section reveal reveal-section">
        <div class="section-heading">
          <p class="eyebrow">Offering</p>
          <h2>ไทยธรรม พระของขวัญ และช่องทางร่วมบุญ</h2>
        </div>
        <div class="split-grid">
          <div class="copy-panel reveal reveal-left">
            <ul class="detail-list">
              <li v-for="item in participation" :key="item">{{ item }}</li>
            </ul>
            <a class="inline-link" href="https://www.dmc.tv/member/" target="_blank" rel="noreferrer">
              ร่วมบุญออนไลน์ที่ dmc.tv/member
            </a>
          </div>
          <div class="media-stack reveal reveal-right">
            <img src="/images/thai-dhamma-3items.jpg" alt="ไทยธรรม 3 อย่าง" />
            <img src="/images/gift-1.jpg" alt="พระของขวัญวันคุ้มครองโลก 2569" />
          </div>
        </div>
      </section>

      <section id="schedule" class="section section-dark reveal reveal-section">
        <div class="section-heading">
          <p class="eyebrow">Schedule</p>
          <h2>กำหนดการตลอดวัน ตั้งแต่นั่งสมาธิถึงพิธีมหาสังฆทานภาคเย็น</h2>
        </div>
        <div class="timeline-grid">
          <article v-for="block in schedule" :key="block.period" class="timeline-card">
            <h3>{{ block.period }}</h3>
            <ul class="detail-list">
              <li v-for="item in block.items" :key="item">{{ item }}</li>
            </ul>
          </article>
        </div>
        <div class="remote-strip reveal reveal-soft">
          <span>ร่วมพิธีออนไลน์ได้ที่</span>
          <a v-for="item in remoteLinks" :key="item.href" :href="item.href" target="_blank" rel="noreferrer">
            {{ item.label }}
          </a>
        </div>
      </section>

      <section id="travel" class="section reveal reveal-section">
        <div class="section-heading">
          <p class="eyebrow">Travel & Registration</p>
          <h2>ข้อมูลรถ จุดลงทะเบียน และลานจอดที่ต้องรู้ก่อนมาถึงวัด</h2>
        </div>
        <div class="travel-layout">
          <div class="reveal reveal-left">
            <ul class="detail-list">
              <li v-for="item in travelNotes" :key="item">{{ item }}</li>
            </ul>
          </div>
          <div class="parking-board reveal reveal-right">
            <h3>ลานจอดตามภูมิภาค</h3>
            <ul class="detail-list">
              <li v-for="item in parking" :key="item">{{ item }}</li>
            </ul>
          </div>
        </div>
      </section>

      <section id="zones" class="section split-section reveal reveal-section">
        <div class="section-heading">
          <p class="eyebrow">Zones & Maps</p>
          <h2>พื้นที่นั่งพระ สาธุชน และจุดบริการ ถูกจัดใหม่ให้เห็นภาพเร็ว</h2>
        </div>
        <div class="zone-grid reveal reveal-soft">
          <article v-for="card in zoneCards" :key="card.title" class="zone-card">
            <h3>{{ card.title }}</h3>
            <p>{{ card.text }}</p>
          </article>
        </div>
        <div class="split-grid split-grid-wide">
          <div class="copy-panel reveal reveal-left">
            <h3>การจัดสรรพื้นที่ลานธรรม</h3>
            <ul class="detail-list">
              <li v-for="item in zoneRules" :key="item">{{ item }}</li>
            </ul>
            <h3>บริการสำคัญ</h3>
            <ul class="detail-list">
              <li v-for="item in servicePoints" :key="item">{{ item }}</li>
            </ul>
          </div>
          <div class="media-stack reveal reveal-right">
            <img src="/images/seating-map.jpg" alt="แผนผังพื้นที่สาธุชนร่วมถวายมหาสังฆทาน" />
            <img src="/images/overnight-map.jpg" alt="จุดพักค้าง พระสังฆาธิการ และสาธุชน" />
          </div>
        </div>
      </section>

      <section id="overnight" class="section section-accent reveal reveal-section">
        <div class="section-heading">
          <p class="eyebrow">Overnight</p>
          <h2>สรุปการพักค้างสำหรับพระภิกษุ สาธุชน และอาสาสมัคร</h2>
        </div>
        <div class="overnight-layout">
          <div class="copy-panel reveal reveal-left">
            <ul class="detail-list">
              <li v-for="item in overnight" :key="item">{{ item }}</li>
            </ul>
          </div>
          <figure class="feature-figure tall-figure reveal reveal-right">
            <img src="/images/gift-2.jpg" alt="พระของขวัญและบรรยากาศประชาสัมพันธ์งาน" />
          </figure>
        </div>
      </section>

      <section id="downloads" class="section reveal reveal-section">
        <div class="section-heading">
          <p class="eyebrow">Downloads</p>
          <h2>เอกสารที่ควรมีไว้ก่อนวันงาน</h2>
        </div>
        <div class="download-grid reveal reveal-soft">
          <a
            v-for="item in downloads"
            :key="item.href"
            class="download-card"
            :href="item.href"
            target="_blank"
            rel="noreferrer"
          >
            <span class="download-label">PDF</span>
            <strong>{{ item.title }}</strong>
            <p>{{ item.meta }}</p>
          </a>
        </div>
      </section>

      <section class="section section-related reveal reveal-section">
        <div class="section-heading">
          <p class="eyebrow">Further Reading</p>
          <h2>ลิงก์ต่อยอดสำหรับผู้ต้องการศึกษารายละเอียดเพิ่มเติม</h2>
        </div>
        <div class="link-list reveal reveal-soft">
          <a v-for="item in related" :key="item.href" :href="item.href" target="_blank" rel="noreferrer">
            {{ item.title }}
          </a>
        </div>
      </section>

      <section class="final-cta reveal reveal-section">
        <p class="eyebrow">Contact</p>
        <h2>สอบถามเพิ่มเติมได้ที่ 02-831-1000</h2>
        <div class="hero-actions">
          <a class="button button-primary" href="https://lin.ee/YQaL4no" target="_blank" rel="noreferrer">
            Line OA วัดพระธรรมกาย
          </a>
          <a
            class="button button-secondary"
            href="https://line.me/R/ti/p/@785epfpj"
            target="_blank"
            rel="noreferrer"
          >
            Line OA ข้อมูล 22 เม.ย. 69
          </a>
        </div>
      </section>
    </main>
  </div>
</template>
