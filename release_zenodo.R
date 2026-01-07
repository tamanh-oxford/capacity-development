# Setup Zenodo release uploads -------------------------------------------------

## Get list and organise PDF files for upload ----

pdfs <- list.files(
  path = "_site", 
  pattern = "pdf",
  recursive = TRUE, 
  full.names = TRUE
) |>
  grepv(pattern = "course-outline|data_governance", invert = TRUE)


## Create metadata for the presentations ----

### Abstract ----

abstract <- list(
  session1  = "Data has become a powerful asset for driving progress in areas like climate action, health care, and economic development through informed decision-making. However, using data for the public good also brings challenges, including inequality and privacy risks. To balance innovation with the protection of individual rights, strong legal frameworks and ethical guidelines for data use are essential.",
  session2  = "The UK data landscape is shaped by a strong focus on using data to drive economic growth, innovation, and better public services, while maintaining public trust. Guided by the National Data Strategy, the UK aims to improve data availability, sharing, and skills across the public and private sectors. Data use is governed by a robust regulatory framework centred on the UK GDPR and the Data Protection Act 2018, with recent reforms such as the Data (Use and Access) Act seeking to enable responsible data sharing and modernise regulation. Oversight is provided by the Information Commissioner's Office, ensuring privacy and security remain priorities as data use expands, particularly in emerging areas like AI.",
  session3  = "Singapore's digital government ecosystem is anchored by the Smart Nation initiative, a whole-of-government vision launched to harness data and digital technologies to improve citizens' lives, strengthen the economy, and create a more responsive and inclusive society. Open Government Products (OGP) is a multidisciplinary team within GovTech that builds digital products, tools, and open data platforms (such as dashboards and APIs) to support evidence-based policymaking, transparency, and public engagement across government. Underpinning these efforts is the Singapore Government Tech Stack (SGTS), a shared suite of secure, reusable digital infrastructure, platforms, and standards that enable government agencies to rapidly develop and scale digital services while ensuring interoperability, cybersecurity, and consistent user experience across the public sector.",
  session4  = "The UN's fragmented and inefficient technology infrastructure drives high costs and limits interoperability, making urgent digital modernisation essential for it to remain effective and credible in the digital age. Although the UN is a major steward of global public data, its fragmented and siloed systems limit interoperability, collaboration, and the ability to generate timely, connected insights needed to address complex global challenges. The UN holds vast and valuable global data, but fragmented and disconnected systems across its entities limit interoperability, reduce impact, and hinder timely, coordinated action on complex global challenges.",
  session5  = "Governments face the challenge of designing national data governance frameworks that balance innovation with trust and protection of rights. Guiding principles for policymaking at the national level provide a shared foundation for shaping coherent, inclusive, and future-ready data governance approaches. These principles help policymakers align legal, institutional, and technical measures to promote responsible data use, interoperability, transparency, and accountability, while ensuring that data serves the public interest and supports national priorities.",
  session6  = "As data becomes increasingly central to decision-making, service delivery, and innovation, effective data governance is essential for organisations seeking to maximise value while managing risk. Best practices in setting up and implementing data governance structures provide practical guidance on how to establish clear leadership, define roles and responsibilities, and create consistent standards for data management and use. By embedding governance into everyday processes and aligning it with organisational objectives, these practices help ensure data is used in a coordinated, ethical, and trustworthy manner, enabling better outcomes and long-term sustainability.",
  session7  = "The global landscape of data technologies is broad and rapidly evolving, encompassing tools for data collection, storage, processing, analysis, sharing, and governance across public and private sectors. Cloud computing platforms, data lakes and warehouses enable scalable storage and processing, while advanced analytics, artificial intelligence, and machine learning tools extract insights from large and complex datasets. Interoperability is supported by APIs, open standards, and data exchange platforms, alongside growing ecosystems for open data and secure data sharing. At the same time, technologies for privacy, cybersecurity, and data governance—such as encryption, identity management, and responsible AI frameworks—are increasingly central, reflecting global efforts to balance innovation with trust, ethics, and regulatory compliance.",
  session8  = "Vietnam's data technology landscape is developing rapidly as part of the country's broader digital transformation agenda, driven by government initiatives, a growing digital economy, and increasing private-sector adoption. Cloud computing, national data platforms, and sectoral databases (such as population, health, and business registries) form the backbone of data infrastructure, while analytics, AI, and big data tools are increasingly used in areas like smart cities, e-government, finance, and manufacturing. The government plays a central role through national strategies on digital government and digital economy, alongside regulations on data security, cybersecurity, and data localisation. At the same time, challenges remain around interoperability, data sharing, skills, and trust, as Vietnam works to balance innovation and growth with data protection and sovereign control.",
  session9  = "The global landscape of human resources for data is shaped by strong and growing demand for professionals with skills in data science, analytics, engineering, governance, and ethics across all sectors. Governments, international organisations, academia, and the private sector compete for talent capable of working with advanced technologies such as AI, big data, and cloud platforms, while also understanding domain knowledge and responsible data use. Capacity is unevenly distributed across regions, with significant skills gaps in many low- and middle-income countries, prompting increased investment in training, reskilling, and international collaboration. At the same time, new roles focused on data stewardship, privacy, and governance are emerging, reflecting the need to balance technical expertise with ethical, legal, and societal considerations.",
  session10 = "Vietnam's human resources landscape for data is expanding quickly as demand grows for skills in data science, analytics, engineering, and artificial intelligence across government, industry, and the digital economy. The workforce is supported by a strong pipeline of STEM graduates and a vibrant technology sector, with universities, training programmes, and private companies increasingly offering data-related education and upskilling. However, capacity remains uneven, with shortages of advanced and specialised expertise, particularly in areas such as data governance, ethics, and large-scale system architecture. Addressing these gaps, while retaining talent and strengthening public-sector capabilities, is a key challenge as Vietnam accelerates its digital transformation.",
  session11 = "Guiding principles and best practices for data capacity building emphasise a holistic, sustainable, and people-centred approach that aligns skills, institutions, and technology with real-world needs. Effective capacity building prioritises clear use cases, strong leadership, and long-term investment in human capital through education, continuous learning, and interdisciplinary collaboration. It also stresses the importance of data governance, ethics, and trust, ensuring that data is used responsibly and inclusively. Best practices highlight partnership across government, academia, the private sector, and international actors as well as the reuse of shared platforms and standards, so that data capabilities are scalable, interoperable, and resilient over time.",
  session12 = "Financing data governance refers to the sustainable funding of the policies, institutions, skills, and technologies needed to manage data responsibly and effectively. It includes investment in legal and regulatory frameworks, data infrastructure, cybersecurity, interoperability, and human capacity, as well as mechanisms for oversight and accountability. As data becomes a critical public and economic asset, financing models increasingly combine public funding, private-sector participation, and international support to ensure long-term viability. Effective financing of data governance helps balance innovation and value creation with trust, privacy, equity, and protection of individual and societal interests.",
  session13 = "Personas for the successful building and implementation of data governance structures and frameworks represent the key roles and stakeholders needed to turn policy into practice. They typically include senior leaders who set vision and provide authority, data stewards and owners who ensure data quality and accountability, technical experts who design and maintain systems, legal and ethics specialists who safeguard rights and compliance, and end users who apply data responsibly to generate value. Clearly defining these personas helps clarify responsibilities, align incentives, and foster collaboration across institutions, ensuring that data governance frameworks are both effective and sustainable."
)

zenodo_title <- list(
  session1  = "Session 1: Global landscape of data governance institutions and frameworks",
  session2  = "Session 2: Case Study: The UK Data Landscape",
  session2  = "Session 3: Case Study: Singapore's Smart Nation, Open Government Products, and Singapore Government Tech Stack",
  session4  = "Session 4: Case Study: The United Nations and its technological and data challenges",
  session5  = "Session 5: Guiding principles on policymaking on national level data governance frameworks",
  session6  = "Session 6: Best practices in setting up and implementing data governance structures",
  session7  = "Session 7: Global landscape of available technologies for data",
  session8  = "Session 8: The landscape of technologies for data in Vietnam",
  session9  = "Session 9: Global landscape of human resources for data",
  session10 = "Session 10: The landscape of human resources for data in Vietnam",
  session11 = "Session 11: Guiding principles and best practices for data capacity building",
  session12 = "Session 12: Financing data governance",
  session13 = "Session 13: Manager personas for successful building and implementation of data governance structures and frameworks for Vietnam"
)

zenodo_date <- list(
  session1  = "2025-12-29",
  session2  = "2025-12-29",
  session3  = "2025-12-29",
  session4  = "2025-12-29",
  session5  = "2025-12-29",
  session6  = "2025-12-29",
  session7  = "2025-12-30",
  session8  = "2025-12-30",
  session9  = "2025-12-30",
  session10 = "2025-12-30",
  session11 = "2025-12-31",
  session12 = "2025-12-31",
  session13 = "2025-12-31"
)

zenodo_format <- "presentation"

zenodo_license <- "CC-BY-NC-4.0"

creator <- list(
  list(
    name = "Ernest Guevarra",
    affiliation = "University of Oxford",
    orcid = "https://orcid.org/0000-0002-4887-4415"
  )
)

contributor <- list(
  list(
    name = "Tran Cong Minh",
    type = "Editor",
    affiliation = "University of Oxford",
    orcid = "https://orcid.org/0000-0003-2622-1365"
  ),
  list(
    name = "Chu Tấn Huy",
    type = "Editor",
    affiliation = "Tâm Anh Research Institute"
  ),
  list(
    name = "Đinh Thị Thu Huyền",
    type = "Editor",
    affiliation = "Tâm Anh Research Institute"
  ),
  list(
    name = "Phương Lễ Trí",
    type = "ProjectLeader",
    affiliation = "Tâm Anh Research Institute"    
  ),
  list(
    name = "Dr Proochista Ariana",
    type = "ProjectLeader",
    affiliation = "University of Oxford",
    orcid = "https://orcid.org/0000-0002-0154-2237"
  )
)

cli <- deposits::depositsClient$new(service = "zenodo", sandbox = FALSE)

cli$deposit_fill_metadata(
  metadata = list(
    title = zenodo_title[[1]],
    abstract = abstract[[1]],
    created = zenodo_date[[1]],
    creator = creator,
    contributor = contributor,
    format = zenodo_format,
    license = zenodo_license
  )
)

cli$deposit_new()

cli$deposit_upload_file(path = pdfs[1])




